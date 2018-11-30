Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :bookings, only: :create
  end


  namespace :host do
    resources :flats, only: [:index]
  end

  resources :pictures, only: [:destroy]
  patch "pictures/:id/make_primary", to: "pictures#make_primary", as: "make_primary"

  resources :bookings, only: :index

  patch 'bookings/:id/approve', to: 'bookings#approve', as: :approve_booking
  patch 'bookings/:id/reject', to: 'bookings#reject', as: :reject_booking

  get 'bookings/:flat_id', to: 'bookings#flat', as: :bookings_for_flat

end
