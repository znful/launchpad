import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["icon"];

  connect() {
    this.setThemeFromStorage();
    this.updateIcon();
  }

  toggle() {
    const body = document.body;
    const currentTheme = body.getAttribute('data-bs-theme');
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    body.setAttribute('data-bs-theme', newTheme);
    localStorage.setItem("theme", newTheme);
    this.updateIcon();
  }

  setThemeFromStorage() {
    const savedTheme = localStorage.getItem("theme");
    const body = document.body;

    if (savedTheme) {
      body.setAttribute('data-bs-theme', savedTheme);
    } else if (window.matchMedia("(prefers-color-scheme: dark)").matches) {
      body.setAttribute('data-bs-theme', 'dark');
    }
  }

  updateIcon() {
    if (!this.hasIconTarget) return;
    const currentTheme = document.body.getAttribute('data-bs-theme');
    const icon = this.iconTarget;

    icon.classList.remove("ti-sun", "ti-moon");

    if (currentTheme == 'dark') {
      icon.classList.add("ti-sun");
    } else {
      icon.classList.add("ti-moon");
    }
  }
}
