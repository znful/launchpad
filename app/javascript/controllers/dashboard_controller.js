import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["form", "dropdown"];
  connect() {
    this.dropdownTargets.forEach((dropdown) => {
      dropdown.addEventListener("hide.bs.dropdown", () => {
        this.submitForm();
      });
    });
  }

  submitForm() {
    console.log("Submitting form...");
    this.formTarget.requestSubmit();
  }
}
