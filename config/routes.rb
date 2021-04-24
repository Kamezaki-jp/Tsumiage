Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/overall_ranking' => 'homes#overall_ranking'
  get 'homes/daily_ranking'   => 'homes#daily_ranking'
  get 'homes/weekly_ranking'  => 'homes#weekly_ranking'
  get 'homes/monthly_ranking' => 'homes#monthly_ranking'
  
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
