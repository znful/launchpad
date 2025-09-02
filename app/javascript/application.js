// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

import "trix";
import "@rails/actiontext";

Turbo.config.forms.confirm = (message, element) => {
  let dialog = document.getElementById("turbo-confirm");
  let messageContainer = document.getElementById("confirm-message");
  messageContainer.textContent = message;
  dialog.showModal();

  return new Promise((resolve) => {
    dialog.addEventListener(
      "close",
      () => {
        resolve(dialog.returnValue === "true");
      },
      { once: true },
    );
  });
};
