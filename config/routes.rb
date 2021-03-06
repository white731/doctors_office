Rails.application.routes.draw do
  root 'static_pages#home'
  
  resources :physicians do 
    resources :appointments
  end
  

  resources :patients do
    resources :appointments
  end

  #index
  get  '/patients/:patient_id/p/appointments', to: 'appointments#patient_home', as: 'patient_home'
  #new
  get  '/patients/:patient_id/p/appointments/new', to: 'appointments#patient_new', as: 'new_patient_appointment_custom'
  #create
  post '/patients/:patient_id/p/appointments', to: 'appointments#patient_create'
  #show
  get  '/patients/:patient_id/p/appointments/:id', to:'appointments#patient_show', as: 'show_patient_appointment'
  #edit
  get  '/patients/:patient_id/p/appointments/:id/edit', to:'appointments#patient_edit', as: 'edit_patient_appointment_custom'
  #update 
  patch  '/patients/:patient_id/p/appointments/:id/', to:'appointments#patient_update'
  #destroy
  delete '/patients/:patient_id/p/appointments/:id/', to:'appointments#patient_destroy'

end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
