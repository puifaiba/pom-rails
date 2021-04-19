Rails.application.routes.draw do
  resources :tasks
  get 'columns/index'
  resources :users, only: [:create, :show, :index]
  resources :chats, only: [:index, :create]
  resources :messages, only: [:index, :create]

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  get '/columns', to: 'columns#index'

  mount ActionCable.server => '/cable'
end
