import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    if (!this.isPreview) {
      // Display with transition
      setTimeout(() => {
        this.element.classList.remove("hidden");
        this.element.classList.add(
          "transition",
          "ease-in-out",
          "duration-300",
          "opacity-0"
        );

        // Trigger transition
        setTimeout(() => this.element.classList.add("opacity-100"), 100);
      }, 500);
    }
  }

  close() {
    // Remove with transition
    this.element.classList.remove(
      "transition",
      "ease-in-out",
      "duration-300",
      "opacity-100"
    );

    // Trigger transition
    setTimeout(() => this.element.classList.add("opacity-0"), 100);

    // Remove element after transition
    setTimeout(() => this.element.remove(), 300);
  }

  get isPreview() {
    return document.documentElement.hasAttribute("data-turbolinks-preview");
  }
}
