import {
  Controller
} from "stimulus"

export default class extends Controller {
  static targets = ["target"]

  close() {
    console.log("close flash by stimulus");
    this.targetTarget.remove();
  }
}