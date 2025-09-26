import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { nextUrl: String }
  static targets = ["sentinel"]

  connect() {
    this.observer = new IntersectionObserver((entries) => {
      if (entries[0].isIntersecting && this.hasNextUrlValue) {
        this.loadMore()
      }
    })

    this.observeSentinel()
  }

  observeSentinel() {
    if (this.hasSentinelTarget) {
      this.observer.observe(this.sentinelTarget)
    }
  }

  loadMore() {
    // Prevent double fetching
    const url = this.nextUrlValue
    if (!url) return

    const spinner = document.getElementById("infinite-scroll-spinner")
    spinner.classList.remove("d-none")

    fetch(url, {
      headers: { Accept: "text/vnd.turbo-stream.html" }
    })
      .then(response => response.text())
      .then(html => {
        Turbo.renderStreamMessage(html)
        spinner.classList.add("d-none")
        setTimeout(() => this.observeSentinel(), 100)
      })
      .catch(() => spinner.classList.add("d-none"))
  }
}
