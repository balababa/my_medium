import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  static targets = ["followButton", "bookmark"]


  connect() {
    let follow = this.followButtonTarget
    let status = follow.innerHTML.trim();
    

    follow.className = (status == "Follow") ? 'follow-button' : 'followed-button'
  }

  //  /stories/:id/clap
  follow(event) {
    event.preventDefault();

    let target = this.followButtonTarget
    let user = target.dataset.user;

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
            target.className = (status == "Follow") ? 'follow-button' : 'followed-button'
      }

    })
    .catch(function(error) {
      console.log(error)
    })
  }

  bookmark(event) {
    event.preventDefault();
    let link = event.currentTarget;
    let slug = link.dataset.slug;
    let icon = this.bookmarkTarget
    // let user = event.currentTarget.dataset.user; 
    
    axios.post(`/api/stories/${slug}/bookmark`)
    .then(function(response) {
      let status = response.data.status;
      switch(status) {
        case 'sign_in_first':
          alert('請先登入')
          break;
        case 'bookmark':
          icon.classList.add('far');
          icon.classList.remove('fas');
        break;
        default:
          icon.classList.add('fas');
          icon.classList.remove('far');
      }
    })
    .catch(function(error) {
      console.log(error)
    })
  }
}
