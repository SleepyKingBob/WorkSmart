import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["first", "second"]

displayForm(){
  this.firstTarget.classList.toggle("invisible")
  this.secondTarget.classList.toggle("invisible")
  }

}


