import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["text", "icon"];

  showText() {
    this.textTarget.classList.remove("d-none");
    this.iconTarget.classList.add("d-none");
  }

  showIcon() {
    this.iconTarget.classList.remove("d-none");
    this.textTarget.classList.add("d-none");
  }
}
