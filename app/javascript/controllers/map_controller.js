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
        background-image: url('${this.#getLocationMarkerImage()}');
        background-color: transparent !important;  /* Fond transparent */
        background-size: 100%;  /* Image un peu plus grande */
        background-repeat: no-repeat;
        background-position: center;
        width: 45px !important;
        height: 45px !important;
        position: absolute;
        bottom: 0;
        right: 0;
        border-radius: 50%;
        border: 3px solid #14f18a;  /* Bordure verte plus épaisse */
        mask-image: radial-gradient(circle at center, black 85%, transparent 85%);
        -webkit-mask-image: radial-gradient(circle at center, black 85%, transparent 85%);
    }

    .mapboxgl-user-location-dot::before,
    .mapboxgl-user-location-dot::after {
        display: none;
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
