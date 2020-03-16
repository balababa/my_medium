import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  static targets = ["followButton"]


  connect() {
    console.log("add clap count by stimulus")
  }

  //  /stories/:id/clap
  follow(event) {
    event.preventDefault();

    let user = this.followButtonTarget.dataset.user;
    let target = this.followButtonTarget
    // let user = event.currentTarget.dataset.user; 

    
    axios.post(`/api/users/${user}/follow`)
    .then(function(response) {
      let status = response.data.status

      switch(status) {
        case 'sign_in_first':
          alert('請先登入')
          break;
          default:
            target.innerHTML = status
      }

    })
    .catch(function(error) {
      console.log(error)
    })
  }
}
