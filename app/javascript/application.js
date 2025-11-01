// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

import "trix";
import "@rails/actiontext";

Turbo.config.forms.confirm = (message, element) => {
  const dialog = document.getElementById("turbo-confirm");
  const messageContainer = dialog.querySelector("#confirm-message");
  const body = document.querySelector("body");
  const modalStatusBar = dialog.querySelector(".modal-status");
  const confirmButton = document.getElementById("confirm-button");
  const modalTitleContainer = document.getElementById("confirm-title");

  const backdrop = document.createElement("div");

  const modalVariant = element.getAttribute("data-variant") || "primary";
  const modalTitle = element.getAttribute("data-title") || "Please Confirm";

  if (modalVariant) {
    modalStatusBar.classList.add(`bg-${modalVariant}`);
    confirmButton.classList.add(`btn-${modalVariant}`);
  }

  if (modalTitle) {
    modalTitleContainer.innerText = modalTitle;
  }

  body.style.overflow = "hidden";
  backdrop.className = "modal-backdrop fade show";

  messageContainer.textContent = message;
  body.classList.add("modal-open");
  body.appendChild(backdrop);

  dialog.classList.remove("d-none");
  dialog.showModal();

  return new Promise((resolve) => {
    dialog.addEventListener(
      "close",
      () => {
        dialog.classList.add("d-none");
        body.classList.remove("modal-open");
        body.removeChild(backdrop);
        body.style.overflow = "auto";
        resolve(dialog.returnValue === "true");
      },
      { once: true },
    );
  });
};
