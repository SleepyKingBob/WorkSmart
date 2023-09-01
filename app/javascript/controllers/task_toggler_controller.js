import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task-toggler"
export default class extends Controller {
  static targets = ["checkbox"]

  connect() {
  }
}
