Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get '/about' => 'home#about', as: :about

  resources :clinician, only: [:new, :create]

  # clinician sessions
  get '/clinician_log_in' => 'sessions#new_clinician', as: :clinician_log_in
  post '/clinician_logs_in' => 'sessions#create_clinician', as: :clinician_logs_in
  # delete '/clinician_log_out' => 'sessions_destroy_clinician', as: :clinician_log_out

  namespace :clinician do
    get '/patients' => 'clinician#patient_index', as: :my_patients
  end

  #patient sessions
  get '/patient_log_in' => 'sessions#new_patient', as: :patient_log_in
  post '/patient_logs_in' => 'sessions#create_patient', as: :patient_logs_in
  # delete '/patient_log_out' => 'sessions_destroy_patient', as: :patient_log_out

  get 'logout' => 'sessions#destroy', :as => 'logout'

  namespace :patient do
    get 'clinician' => 'patient#clinician', as: :my_clinician
  end




end
