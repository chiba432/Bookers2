Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root to: 'books#top'
  resources :books
  get "home/about" => "books#about"
  resources :users, only: [:show, :index, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
