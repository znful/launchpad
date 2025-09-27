import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sentinel"]
  static values = { nextUrl: String }

  connect() {
    if (!this.hasSentinelTarget) return
    this.observe()
  }

  observe() {
    this.observer = new IntersectionObserver(entries => {
      if (entries[0].isIntersecting) {
        this.loadMore()
      }
    }, {
      root: null,
      rootMargin: "200px"
    })

    this.observer.observe(this.sentinelTarget)
  }

  async loadMore() {
    if (!this.nextUrlValue) return

    this.showSpinner()

    try {
      const response = await fetch(this.nextUrlValue, {
        headers: { "Accept": "text/vnd.turbo-stream.html" }
      })

      if (response.ok) {
        const html = await response.text()
        Turbo.renderStreamMessage(html)
      } else {
        console.error("Failed to load:", response.statusText)
      }
    } catch (e) {
      console.error("Error loading more:", e)
    } finally {
      this.hideSpinner()
    }
  }

  showSpinner() {
    document.getElementById("infinite-scroll-spinner")?.classList.remove("d-none")
  }

  hideSpinner() {
    document.getElementById("infinite-scroll-spinner")?.classList.add("d-none")
  }
}
