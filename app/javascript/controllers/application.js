import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// Configure external controllers
import Chart from "stimulus-chartjs"
application.register("chart", Chart)

export { application }
