import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="statistics"
export default class extends Controller {
  static targets = ["offer"];

  initialize() {
    this.viewedOffers = new Set();
    this.interactedOffers = new Set();
    this.appliedOffers = new Set();
    this.CSRF_TOKEN = "";
    this.timeoutId = null;
  }

  connect() {
    this.CSRF_TOKEN = this._getCsrfToken();
    this.incrementViewCounts();
    window.addEventListener("scroll", () => {
      if (this.timeoutId) {
        clearTimeout(this.timeoutId);
      }
      this.timeoutId = setTimeout(() => {
        this.incrementViewCounts();
      }, 500);
    });
  }

  incrementViewCounts() {
    this.offerTargets.forEach((offer) => {
      const offerId = offer.dataset.offerId;
      if (!this.viewedOffers.has(offerId) && this._isElementInViewport(offer)) {
        this.viewedOffers.add(offerId);
        this._sendStatisticIncrement(offerId, "view");
      }
    });
  }

  incrementInteractionCount({ params: { offerId } }) {
    if (this.interactedOffers.has(offerId)) {
      return;
    }
    this._sendStatisticIncrement(offerId, "interaction");
    this.interactedOffers.add(offerId);
  }

  incrementApplicationCount({ params: { offerId } }) {
    if (this.appliedOffers.has(offerId)) {
      return;
    }
    this._sendStatisticIncrement(offerId, "application");
    this.appliedOffers.add(offerId);
  }

  _isElementInViewport(el) {
    const rect = el.getBoundingClientRect();
    return (
      rect.top >= 0 &&
      rect.left >= 0 &&
      rect.bottom <=
        (window.innerHeight || document.documentElement.clientHeight) &&
      rect.right <= (window.innerWidth || document.documentElement.clientWidth)
    );
  }

  _sendStatisticIncrement(offerId, statType) {
    fetch(`/statistic`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": this.CSRF_TOKEN,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ offer_id: offerId, stat_type: statType }),
    });
  }

  _getCsrfToken() {
    const meta = document.querySelector('meta[name="csrf-token"]');
    return meta ? meta.getAttribute("content") : "";
  }
}
