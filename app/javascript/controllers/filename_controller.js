import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["target", "output" ]


  connect() {
    console.log("change file name by stimulus")
    const fileInput = this.targetTarget;
    fileInput.onchange = () => {
      if (fileInput.files.length > 0) {
        this.outputTarget.textContent = fileInput.files[0].name;
      }
    }
    
  }
}
