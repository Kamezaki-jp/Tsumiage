Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  post '/homes/guest_sign_in', to: 'homes#new_guest'
end
