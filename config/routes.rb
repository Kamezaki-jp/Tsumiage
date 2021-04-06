Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  resources :users
  
end
