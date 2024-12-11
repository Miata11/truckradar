import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["professionalFields", "personalFields"];

  connect() {
    this.toggleFields();
  }

  toggleFields() {
    const checkbox = this.element.querySelector("input[type='checkbox']");
    const isProfessional = checkbox && checkbox.checked;

    // Affiche les champs professionnels en plus des champs personnels
    if (this.hasProfessionalFieldsTarget) {
      this.professionalFieldsTarget.style.display = isProfessional ? "block" : "none";
    }
  }
}
