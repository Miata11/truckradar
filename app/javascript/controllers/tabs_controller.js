document.addEventListener('DOMContentLoaded', () => {
  const tabLinks = document.querySelectorAll('.tab-link-dashboard');
  const tabContents = document.querySelectorAll('.tab-content-dashboard');

  tabLinks.forEach(link => {
    link.addEventListener('click', () => {
      const target = link.getAttribute('data-tab-target');

      // Retirer la classe active et cacher tous les contenus
      tabLinks.forEach(tab => {
        tab.classList.remove('active');
        tab.setAttribute('aria-selected', 'false');
      });

      tabContents.forEach(content => {
        content.style.display = 'none';
      });

      // Activer le lien et afficher le contenu correspondant
      link.classList.add('active');
      link.setAttribute('aria-selected', 'true');
      document.getElementById(target).style.display = 'block';
    });
  });

  // Initialisation avec l'onglet actif par défaut
  const activeTab = document.querySelector('.tab-link-dashboard.active');
  if (activeTab) {
    const target = activeTab.getAttribute('data-tab-target');
    document.getElementById(target).style.display = 'block';
  }
});
