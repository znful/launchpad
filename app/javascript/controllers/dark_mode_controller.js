import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = ["icon"]

    initialize() {
        if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
            document.documentElement.classList.add('dark')
			this.iconTarget.textContent = "🌙"
        } else {
            document.documentElement.classList.remove('dark')
			this.iconTarget.textContent = "☀️"
        }
    }

    toggle() {
        if (localStorage.theme === 'dark') {
            localStorage.theme = 'light'
			this.iconTarget.textContent = "☀️"
        } else {
            localStorage.theme = 'dark'
			this.iconTarget.textContent = "🌙"
        }
        this.initialize()
    }
}
