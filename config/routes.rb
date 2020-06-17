Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :api do
    resources :users, only: [] do
      member do
        post :follow
      end
    end

    resources :stories, only: [] do
      member do
        post :clap
        post :bookmark
      end
    end  

    post :upload_image, to: "utils#upload_image"
  end

  resources :users, only: [] do
    collection do
      get :pricing
      get :payment
      post :pay
    end
  end
  


  resources :stories do
    resources :comments, only: [:create]
  end


  # /@allen/文章標題-123
  get '/@:username/:story_id', to: 'pages#show', as: "story_page", constraints: { story_id: /\d/ }
  get '/@:username/bookmarks', to: 'users#bookmarks', as: "user_bookmark"
  get '/@:username/followings', to: 'users#followings', as: "user_following"
  # /@allen
  get '/@:username', to: 'pages#user', as: "user_page"

  root 'pages#index'  
end
