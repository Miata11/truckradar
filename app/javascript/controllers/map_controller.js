import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log(this.element.dataset.imageFoodtruck)
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/light-v11"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    // Style du marker de géolocalisation selon le rôle de l'utilisateur
    const userRole = document.body.dataset.userRole
    const style = document.createElement('style')
    style.textContent = `
     .mapboxgl-user-location-dot {
        background-image: url('${this.#getLocationMarkerImage()}'); /* Chemin de l'image personnalisée */
        background-size: cover; /* Ajuste l'image pour qu'elle couvre tout l'espace */
        background-repeat: no-repeat;
        background-position: center;
        width: 30px;
        height: 30px;
        border-radius: 50%; /* Cercle parfait */
        background-color: #00ff00; /* Vert pour indiquer la géolocalisation */
        border: 2px solid #ffffff; /* Ajoute une bordure blanche */
      }

      .mapboxgl-user-location-dot::before,
      .mapboxgl-user-location-dot::after {
        display: none; /* Désactiver les animations par défaut de la géolocalisation */
      }
    `
    document.head.appendChild(style)

    // Ajouter le contrôle de géolocalisation pour tous les utilisateurs
    const geolocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true,
      showUserHeading: true
    });

      this.map.addControl(geolocate);
      geolocate.on('geolocate', (e) => {
        const longitude = e.coords.longitude;
        const latitude = e.coords.latitude;
        const position = [longitude, latitude];
        console.log('User location:', position);

        // Supprimer le marqueur de l'utilisateur connecté
        this.#removeCurrentUserMarker();
      });
  }

  #getLocationMarkerImage() {
    const userRole = document.body.dataset.userRole
    if (userRole === 'true') {
      return this.element.dataset.imageFoodtruck
    } else {
      return '/assets/user_marker.png'
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      const isCurrentUser = marker.is_current_user || false;
      const mapMarker = new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
      if (isCurrentUser) {
        this.currentUserMarker = mapMarker;
      }
    })
  }

  #removeCurrentUserMarker() {
    console.log(this.currentUserMarker)
    console.log("hey")
    if(this.currentUserMarker) {
      this.currentUserMarker.remove();
    }
  }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
