Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  post 'follow/:id'         => 'relationships#follow',    as: 'follow'
  post 'unfollow/:id'       => 'relationships#unfollow',  as: 'unfollow'
  get  'user/:id/follows'   => 'relationships#follows',   as: 'follows'
  get  'user/:id/followers' => 'relationships#followers', as: 'followers'
  
  get  '/search'            => 'searches#search'
  
  resources :users
  resources :tweets do
    resource :cheers, only: [:create, :destroy]
    resources :tweet_comments, only: [:create, :destroy]
  end
  resources :tasks
end
