import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    flatpickr(this.element,
    {
       dateFormat: "D, d M Y",
    })
    flatpickr(".expected_hours",
      {
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i",
        time_24hr: true
    })
  }

}
