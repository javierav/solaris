import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Import and register TailwindCSS Components
import { Dropdown } from "tailwindcss-stimulus-components"
application.register('dropdown', Dropdown)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// Configure external controllers
import Chart from "stimulus-chartjs"
application.register("chart", Chart)

export { application }
