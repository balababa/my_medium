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
    // let user = event.currentTarget.dataset.user; 

    console.log(user)
    axios.post(`/users/${user}/follow`)
    .then(function(response) {
      console.log(response.data)
    })
    .catch(function(error) {
      console.log(error)
    })
  }
}
