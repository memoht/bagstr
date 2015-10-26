Rails.application.routes.draw do
  
  resources :lockers
  root 'pages#dashboard'
end
