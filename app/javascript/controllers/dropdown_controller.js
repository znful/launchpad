import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = ["menu"]

	toggle() {
		event.stopPropagation();
		this.menuTarget.classList.toggle("hidden")
	}

	hide(event) {
		if (this.element.contains(event.target)) {
			return // Do nothing if the click is inside the dropdown
		}
		this.menuTarget.classList.add("hidden")
	}
}
