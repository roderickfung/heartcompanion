Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get '/about' => 'home#about', as: :about

  resources :clinicians, only: [:new, :create, :show, :edit, :update]

  # clinician sessions
  get '/clinician_log_in' => 'sessions#new_clinician', as: :clinician_log_in
  post '/clinician_logs_in' => 'sessions#create_clinician', as: :clinician_logs_in
  # delete '/clinician_log_out' => 'sessions_destroy_clinician', as: :clinician_log_out

  namespace :clinician do
    get '/patients' => 'my_patients#index', as: :my_patients
    get '/patients/' =>  'my_patients#show', as: :my_patient
  end

  #patient sessions
  get '/patient_log_in' => 'sessions#new_patient', as: :patient_log_in
  post '/patient_logs_in' => 'sessions#create_patient', as: :patient_logs_in
  # delete '/patient_log_out' => 'sessions_destroy_patient', as: :patient_log_out

  delete 'logout' => 'sessions#destroy', :as => 'logout'

  namespace :patient do
    get 'clinician' => 'clinician#show', as: :my_clinician
  end




end
