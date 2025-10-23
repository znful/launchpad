// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

import "trix";
import "@rails/actiontext";

Turbo.config.forms.confirm = (message, _) => {
  let dialog = document.getElementById("turbo-confirm");
  let messageContainer = dialog.querySelector("#confirm-message");
  const closeButton = dialog.querySelector(".btn-close");

  closeButton.addEventListener(
    "click",
    () => {
      dialog.close("false");
    },
    { once: true },
  );

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
