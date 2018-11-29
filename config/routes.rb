Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats, only: [:new, :create, :index, :show]

  namespace :host do
    resources :flats, only: [:index]
  end

  resources :bookings, only: [:create, :index]

  patch 'bookings/approve', to: 'bookings#approve', as: :approve_booking
  patch 'bookings/reject', to: 'bookings#reject', as: :reject_booking
end
