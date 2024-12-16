import { Application } from "@hotwired/stimulus"
import StarRating from "star-rating.js"; // Import de star-rating.js
import "controllers"; // Import des contrôleurs Stimulus

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
