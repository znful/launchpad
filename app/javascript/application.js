// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

import "trix";
import "@rails/actiontext";

Turbo.config.forms.confirm = (message, _) => {
  const dialog = document.getElementById("turbo-confirm");
  const messageContainer = dialog.querySelector("#confirm-message");
  const confirmButton = dialog.querySelector("#confirm-button");
  const body = document.querySelector("body");
  const backdrop = document.createElement("div");
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
        resolve(dialog.returnValue === "true");
      },
      { once: true },
    );
  });
};
