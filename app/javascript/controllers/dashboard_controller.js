import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["form"];
  connect() {}

  submitForm() {
    console.log("Submitting form...");
    this.formTarget.requestSubmit();
  }
}
