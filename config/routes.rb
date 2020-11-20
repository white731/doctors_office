Rails.application.routes.draw do
  root 'static_pages#home'
  
  resources :physicians do 
    resources :appointments
  end
  

  resources :patients do
    resources :appointments
  end

  end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
