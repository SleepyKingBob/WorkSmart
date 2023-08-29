import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["sidebar"]

  connect() {
  }

  toggle() {
    this.sidebarTarget.classList.toggle("d-none")
  }
}
