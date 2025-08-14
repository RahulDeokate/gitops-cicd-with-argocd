function scrollToSection(id) {
    document.getElementById(id).scrollIntoView({ behavior: "smooth" });
}

document.querySelector("form").addEventListener("submit", function(e) {
    e.preventDefault();
    alert("📩 Thank you for contacting me! I will get back to you soon.");
});