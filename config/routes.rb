Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get '/about' => 'home#about', as: :about

  resources :clinicians, only: [:new, :create, :show, :edit, :update] do
    member do
      resources :patients, only: [:index, :new, :create, :edit, :update]
      # get :patients
      get 'patients/:id' => 'clinician#patient', as: :patient
      get
    end
  end

  resources :patients, only: []

  # resources :patients, module: 'clinicians', only: [:show, :index]

  # namespace :clinician do
  #   resources :patients, only: [:show, :index]
  # end

  # namespace :clinician do
  #   resources :my_patients, only: [:show, :index]
  #   # get '/patients' => 'my_patients#index', as: :my_patients
  #   # get '/patients/:id' =>  'my_patients#show', as: :my_patient
  # end

  #patient sessions
  get '/patient_log_in' => 'sessions#new_patient', as: :patient_log_in
  post '/patient_logs_in' => 'sessions#create_patient', as: :patient_logs_in
  # delete '/patient_log_out' => 'sessions_destroy_patient', as: :patient_log_out

  # clinician sessions
  get '/clinician_log_in' => 'sessions#new_clinician', as: :clinician_log_in
  post '/clinician_logs_in' => 'sessions#create_clinician', as: :clinician_logs_in
  # delete '/clinician_log_out' => 'sessions_destroy_clinician', as: :clinician_log_out

  delete 'logout' => 'sessions#destroy', :as => 'logout'


  # namespace :patient do
  #   get 'clinician' => 'clinician#show', as: :my_clinician
  # end




end
