import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tabLink", "tabContent"];

  connect() {
    // Afficher l'onglet actif par défaut lors du chargement
    const activeTab = this.tabLinkTargets.find(link => link.classList.contains("active"));
    if (activeTab) {
      this.showTab(activeTab);
    }
  }

  change(event) {
    event.preventDefault();
    const targetTab = event.currentTarget;

    // Afficher le contenu associé à l'onglet sélectionné
    this.showTab(targetTab);
  }

  showTab(targetTab) {
    const targetId = targetTab.dataset.tabTarget;

    // Réinitialiser tous les onglets
    this.tabLinkTargets.forEach(link => {
      link.classList.remove("active");
      link.setAttribute("aria-selected", "false");
    });

    this.tabContentTargets.forEach(content => {
      content.style.display = "none";
    });

    // Activer l'onglet cliqué et afficher le contenu correspondant
    targetTab.classList.add("active");
    targetTab.setAttribute("aria-selected", "true");
    const targetContent = this.tabContentTargets.find(content => content.id === targetId);
    if (targetContent) {
      targetContent.style.display = "block";
    }
  }
}
