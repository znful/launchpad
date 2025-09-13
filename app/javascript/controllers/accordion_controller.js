import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    isBound: Boolean,
    isAlwaysOpen: Boolean,
  };

  static targets = ["item", "content"];

  connect() {}

  // Renamed 'getContent' to 'findContent' for clarity
  findContent({ button }) {
    const contentId = button.getAttribute("aria-controls");
    const content = document.getElementById(contentId);
    const isCollapsing = content.classList.contains("is-collapsing");
    const isOpened = content.getAttribute("hidden") === null;

    return {
      content,
      isCollapsing,
      isOpened,
    };
  }

  handleContentTransitionEnd({ content, isOpened }) {
    const onTransitionEnd = (event) => {
      const { propertyName } = event;

      if (propertyName !== "height") {
        return;
      }

      content.classList.remove("is-collapsing");
      content.style.height = "";

      if (isOpened) {
        content.setAttribute("hidden", true);
      }
    };

    content.addEventListener("transitionend", onTransitionEnd, { once: true });
  }

  toggle(event) {
    event.preventDefault();

    const { currentTarget: button } = event;
    const { content, isCollapsing, isOpened } = this.findContent({ button });

    if (isCollapsing) {
      return;
    }

    this.handleContentTransitionEnd({ content, isOpened });

    if (isOpened) {
      if (this.isAlwaysOpenValue) {
        return;
      }

      this.close({ button, content });
    } else {
      this.open({ button, content });

      if (this.isBoundValue) {
        this.closeAllBut({ button });
      }
    }
  }

  open({ button, content }) {
    content.classList.add("is-collapsing");
    content.removeAttribute("hidden");

    button.setAttribute("aria-expanded", true);

    requestAnimationFrame(() => {
      setTimeout(() => {
        content.style.height = `${content.scrollHeight}px`;
      }, 0);
    });
  }

  close({ button, content }) {
    content.style.height = `${content.scrollHeight}px`;
    content.classList.add("is-collapsing");

    button.setAttribute("aria-expanded", false);

    requestAnimationFrame(() => {
      setTimeout(() => {
        content.style.height = "0px";
      }, 0);
    });
  }

  closeAllBut({ button }) {
    const buttons = [...this.element.querySelectorAll('[data-action="accordion#toggle"]')].filter(
      (item) => item !== button
    );

    buttons.forEach((button) => {
      const { content, isCollapsing, isOpened } = this.findContent({ button });

      if (isCollapsing) {
        return;
      }

      this.handleContentTransitionEnd({ content, isOpened });

      if (isOpened) {
        this.close({ button, content });
      }
    });
  }
}
