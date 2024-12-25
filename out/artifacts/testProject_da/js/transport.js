function showSection(sectionID){
  const sections = document.querySelectorAll(".section");
  sections.forEach(section => section.classList.remove('active'));
  document.getElementById(sectionID).classList.add('active');
}

