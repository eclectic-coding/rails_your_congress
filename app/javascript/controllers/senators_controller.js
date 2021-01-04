import { Controller } from "stimulus"
import StimulusReflex from "stimulus_reflex"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    console.log('Connect Stimulus and Reflex')
    StimulusReflex.register(this)
  }
}
