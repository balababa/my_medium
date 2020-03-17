import { Controller } from "stimulus"
import FroalaEditor from 'froala-editor'
import 'froala-editor/js/languages/zh_tw'
import 'froala-editor/js/plugins/colors.min.js'
import 'froala-editor/js/plugins/link.min.js'
import 'froala-editor/js/plugins/quick_insert.min.js'
import 'froala-editor/js/plugins/quote.min.js'
import 'froala-editor/js/plugins/image.min.js'
import 'froala-editor/js/plugins/draggable.min.js'
import 'froala-editor/js/plugins/table.min.js'
import 'froala-editor/js/plugins/fullscreen.min.js'
import 'froala-editor/js/plugins/video.min.js'



export default class extends Controller {
  static targets = []


  connect() {
    var editor = new FroalaEditor('#story_content', {
      language: 'zh_tw',
      spellcheck: false,
      imageUploadURL: '/api/upload_image'
    });

  }
}
