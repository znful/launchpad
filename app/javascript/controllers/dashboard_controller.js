import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["form", "dropdown"];
  connect() {
    // Add event listener to each dropdown to submit the form on hide
    this.dropdownTargets.forEach((dropdown) => {
      dropdown.addEventListener("hide.bs.dropdown", () => {
        this.submitForm();
      });
    });
  }

  submitForm() {
    this.formTarget.requestSubmit();
  }
}
