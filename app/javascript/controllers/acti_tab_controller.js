import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="acti-tab"
export default class extends Controller {
  static targets=["profil", "foodtruck"]
  connect() {
    console.log(this.profilTarget)
    console.log(this.foodtruckTarget)
  }
  toggle(){
    this.profilTarget.classList.remove(".active")
    this.foodtruckTarget.classList.add(".active")
  }
}
