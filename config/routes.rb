Rails.application.routes.draw do

  resources :lockers
  resources :reservations
  root 'pages#dashboard'
end
