import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Selected filters controller connected.")
  }

  update(event) {
    const form = event.target.closest("form")
    if (form) {
      form.requestSubmit()
    }
  }
}
