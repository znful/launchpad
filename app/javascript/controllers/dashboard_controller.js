import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["form", "dropdown", "badgesContainer"];
  connect() {
    // Add event listener to each dropdown to submit the form on hide
    this.dropdownTargets.forEach((dropdown) => {
      dropdown.addEventListener("hide.bs.dropdown", () => {
        this.submitForm();
      });
    });

    // Append filter badges to the badges container
    this.appendFilterBadges();
  }

  submitForm() {
    console.log("Submitting form...");
    this.formTarget.requestSubmit();
  }

  // TODO: Implement the remove filter functionality, show the actual filter instead of its ransack key
  // Update the dropdown labels to show amount of selected filters
  appendFilterBadges() {
    const urlParams = new URLSearchParams(window.location.search);
    const badgesContainer = this.badgesContainerTarget;

    // Clear existing badges
    badgesContainer.innerHTML = "";

    // Iterate over each parameter in the URL
    urlParams.forEach((value, key) => {
      if (value) {
        // Create a badge element
        const badge = document.createElement("span");
        badge.className = "badge bg-blue-lt me-2";
        badge.textContent = `${key}: ${value}`;

        // Create a remove button for the badge
        const removeButton = document.createElement("button");
        removeButton.type = "button";
        removeButton.className = "btn-close btn-close-white btn-sm ms-2";
        removeButton.setAttribute("aria-label", "Remove");
        removeButton.addEventListener("click", () => {});
        // Append the remove button to the badge
        badge.appendChild(removeButton);

        // Append the badge to the badges container
        badgesContainer.appendChild(badge);
      }
    });
  }
}
