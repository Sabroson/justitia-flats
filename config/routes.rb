Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats, only: [:new, :create, :index, :show, :edit, :update]

  namespace :host do
    resources :flats, only: [:index]
  end

  resources :pictures, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
