import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  static targets = ["clapCount"]


  connect() {
    var timeout;
    var count = 0;
    let button = this.clapCountTarget.parentNode;
    button.addEventListener("mousedown", function(){ 
      timeout = setInterval(( () => button.click() ), 100);
     });

     button.addEventListener("mouseup", function(){ 
      clearTimeout(timeout);
     });

     

  }

  //  /stories/:id/clap
  addClap(event) {
    event.preventDefault();

    let slug = event.currentTarget.dataset.slug;
    let target = this.clapCountTarget;

    axios.post(`/api/stories/${slug}/clap`)
      .then(function(response) {
        let status = response.data.status;
        switch(status) {
          case 'sign_in_first':
            alert('請先登入');
          break;
          default:
            target.innerHTML = status;
        }
      })
      .catch(function(error) {
        console.log(error)
      })
  }
}
