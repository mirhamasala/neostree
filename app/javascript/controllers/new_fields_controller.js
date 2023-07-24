import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["fieldsContainer", "template"];

  addNewField() {
    const content = this.templateTarget.innerHTML.replace(
      /NEW_RECORD/g,
      new Date().getTime()
    );
    this.fieldsContainerTarget.insertAdjacentHTML("beforeend", content);
  }

  removeField(event) {
    event.preventDefault();
    let wrapper = event.target.closest(".nested-fields");
    if (wrapper.dataset.newRecord === "true") {
      wrapper.remove();
    } else {
      wrapper.querySelector(`input[name*='_destroy']`).value = 1;
      wrapper.style.display = "none";
    }
  }
}
