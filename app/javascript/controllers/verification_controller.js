import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["text", "icon"];

  toggle() {
    this.textTarget.classList.toggle("d-none");
    this.iconTarget.classList.toggle("d-none");
  }
}
