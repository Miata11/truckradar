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

// Gestion des favoris (toggle)
  async toggleFavorite(event) {
    event.preventDefault();
    const button = event.currentTarget;
    const url = button.dataset.favoriteUrl;
    const method = button.dataset.favoriteMethod;

    try {
      const response = await fetch(url, {
        method: method,
        headers: {
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
          "Content-Type": "application/json",
        },
      });

      if (response.ok) {
        // Toggle l'apparence du cœur
        const icon = button.querySelector("i");
        if (method === "post") {
          icon.classList.remove("far", "text-muted");
          icon.classList.add("fas", "text-danger");
          button.dataset.favoriteMethod = "delete";
          button.dataset.favoriteUrl = await response.json().url;
        } else {
          icon.classList.remove("fas", "text-danger");
          icon.classList.add("far", "text-muted");
          button.dataset.favoriteMethod = "post";
          button.dataset.favoriteUrl = await response.json().url;
        }
      } else {
        console.error("Erreur lors de la mise à jour des favoris");
      }
    } catch (error) {
      console.error("Erreur réseau :", error);
    }
  }

}
