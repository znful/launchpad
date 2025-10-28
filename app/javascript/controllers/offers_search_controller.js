import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox", "output", "badgeContainer"]

  connect() {
    this.update()
  }

  update() {
    this.outputTarget.innerHTML = ""

    this.checkboxTargets.forEach((cb) => {
      if (cb.checked) {
        // Use the badgeContainer target inside the same label
        const badgeHtml = cb.closest("label")
          .querySelector("[data-offers-search-target='badgeContainer']")
          .querySelector(".checked-icon").innerHTML

        const wrapper = document.createElement("span")
        wrapper.innerHTML = badgeHtml
        const badge = wrapper.firstElementChild

        badge.classList.add("me-1", "d-inline-flex", "align-items-center", "gap-1")

        badge.insertAdjacentHTML(
          "beforeend",
          `<button type="button" class="btn-close btn-close-white btn-sm" aria-label="Remove"></button>`
        )

        badge.querySelector("button").addEventListener("click", (e) => {
          e.stopPropagation()
          cb.checked = false
          cb.dispatchEvent(new Event("change"))
          this.update()
        })

        this.outputTarget.appendChild(badge)
      }

      this.submitForm()
    })

  }

  submitForm(event) {
    const form = this.element.closest("form")
    if (form) form.requestSubmit()
  }
}
