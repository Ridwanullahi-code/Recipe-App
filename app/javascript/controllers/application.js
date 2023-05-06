import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


const test = document.querySelector(".open-button")
const shoppingList = document.querySelector(".shopping-list")

