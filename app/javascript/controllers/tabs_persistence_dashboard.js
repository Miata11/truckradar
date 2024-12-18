document.addEventListener("DOMContentLoaded", () => {
  console.log("JavaScript fonctionne correctement !");

  // Récupère l'onglet actif depuis l'URL (ancre) ou localStorage
  const urlHash = window.location.hash; // Récupère l'ancre de l'URL
  const activeTabId = urlHash || localStorage.getItem("activeTab");

  if (activeTabId) {
    const tabElement = document.querySelector(`[data-bs-target="${activeTabId}"]`);
    if (tabElement) {
      console.log("Onglet restauré :", activeTabId);
      new bootstrap.Tab(tabElement).show();
    }
  }

  // Écoute le changement d'onglet et sauvegarde l'onglet actif
  const tabs = document.querySelectorAll('[data-bs-toggle="tab"]');
  tabs.forEach((tab) => {
    tab.addEventListener("shown.bs.tab", (event) => {
      const target = event.target.getAttribute("data-bs-target");
      localStorage.setItem("activeTab", target);
      history.pushState(null, null, target); // Met à jour l'URL avec l'ancre
      console.log("Onglet actif sauvegardé :", target);
    });
  });
});
