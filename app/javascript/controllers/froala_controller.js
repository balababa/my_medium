import { Controller } from "stimulus"
import FroalaEditor from 'froala-editor'

export default class extends Controller {
  static targets = ["target", "output" ]


  connect() {
  
  var editor = new FroalaEditor('#story_content');

  }
}
