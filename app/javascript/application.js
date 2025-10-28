// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

import "trix";
import "@rails/actiontext";

Turbo.config.forms.confirm = (message, _) => {
  const dialog = document.getElementById("turbo-confirm");
  const messageContainer = dialog.querySelector("#confirm-message");
  const confirmButton = dialog.querySelector("#confirm-button");

  messageContainer.textContent = message;

  dialog.classList.remove("d-none");
  dialog.showModal();

  return new Promise((resolve) => {
    dialog.addEventListener(
      "close",
      () => {
        dialog.classList.add("d-none");
        resolve(dialog.returnValue === "true");
      },
      { once: true },
    );
  });
};
