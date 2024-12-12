import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    // Style du marker de géolocalisation selon le rôle de l'utilisateur
    const userRole = document.body.dataset.userRole
    const style = document.createElement('style')
    style.textContent = `
      .mapboxgl-user-location-dot {
        background-image: url('/assets/${this.#getLocationMarkerImage()}');
        background-size: contain;
        background-repeat: no-repeat;
        background-position: center;
        width: 30px;
        height: 30px;
        border-radius: 0;
        background-color: transparent;
      }
      .mapboxgl-user-location-dot::before,
      .mapboxgl-user-location-dot::after {
        display: none;
      }
    `
    document.head.appendChild(style)

    // Ajouter le contrôle de géolocalisation pour tous les utilisateurs
    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: true
      })
    )
  }

  #getLocationMarkerImage() {
    const userRole = document.body.dataset.userRole
    if (userRole === 'true') {
      return 'foodtruck_connected.png'
    } else {
      return 'user_marker.png'
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
