Rails.application.routes.draw do
  root 'static_pages#home'
  
  resources :physicians do 
    resources :appointments
  end
  

  resources :patients do
    resources :appointments
  end

  get '/patients/:patient_id/p/appointments', to: "appointments#patient_home", as: 'patient_home'
  get '/patients/:patient_id/p/appointments/:id', to:"appointments#patient_show", as: 'show_patient_appointment'

  get '/patients/:patient_id/p/appointments/new', to: "appointments#patient_new", as: 'new_patient_appointment_custom'
  post '/patients/:patient_id/p/appointments', to: "appointments#patient_create"

  

end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
