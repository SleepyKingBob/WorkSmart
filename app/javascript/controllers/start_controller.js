import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="start"
export default class extends Controller {
  static targets = ["time", "form", "change"]

  connect() {

  }

  updateSchedule(){
    console.log("something")
    console.log(document.querySelector("#schedule_start_time"))
    // step 1 : get the current time and insert it into the input field (start_date)
    let time = new Date()
    time = time.toString().split(" ")[4]
    document.querySelector("#schedule_start_time").value = time


    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((data) => {
      // console.log(data)
      this.changeTarget.outerHTML = data
    })


    // step 2 : call the update action with AJAX - fetch

  }

}
