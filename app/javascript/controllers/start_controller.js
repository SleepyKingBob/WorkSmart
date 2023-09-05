import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="start"
export default class extends Controller {
  static targets = ["time", "form", "change", "startTime", "firstBreak"]

  connect() {
    console.log(this.startTimeTarget)
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

    let firstBreakHour = this.firstBreakTarget.innerText.substring(7, 9)
    let firstBreakMin = this.firstBreakTarget.innerText.substring(10, 12)
    var firstBreak = new Date()
    firstBreak.setHours(parseInt(firstBreakHour))
    firstBreak.setMinutes(parseInt(firstBreakMin))
    console.log(firstBreak)
    console.log(new Date())
    setTimeout(() => {
      window.alert("Take a break Dude");
    }, firstBreak -  new Date() );

    // step 2 : call the update action with AJAX - fetch

  }

}
