import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="offers"
export default class extends Controller {
  static targets = ["offer"];

  viewedOffers = new Set();

  connect() {
    console.debug("Offers controller connected");
    console.log(this.offerTargets);
    this.addViews();
    window.addEventListener("scroll", () => this.addViews());
  }

  addViews() {
    this.offerTargets.forEach((offer) => {
      if (this.isInViewport(offer) && !this.viewedOffers.has(offer)) {
        const offerId = offer.dataset.offerId;
        this.viewedOffers.add(offer);
        fetch(`/api/increment_view_count`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document
              .querySelector('meta[name="csrf-token"]')
              .getAttribute("content"),
          },
          body: JSON.stringify({ offer_id: offerId }),
        });
      }
    });
  }

  isInViewport(element) {
    const rect = element.getBoundingClientRect();
    return (
      rect.top >= 0 &&
      rect.left >= 0 &&
      rect.bottom <=
        (window.innerHeight || document.documentElement.clientHeight) &&
      rect.right <= (window.innerWidth || document.documentElement.clientWidth)
    );
  }
}
