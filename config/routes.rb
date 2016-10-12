Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get '/about' => 'home#about', as: :about

  resources :clinicians
  resources :patients, only: [:show, :edit, :update]

  namespace :clinicians, path: 'clinician' do
    resources :patients, only: [:new, :create, :index, :show, :edit, :update]
  end

  namespace :patients, path: 'patient' do
    resources :clinicians, only: [:show]
    resources :patient_logs, path: 'logs', only: [:new, :create, :index, :show]
  end

  # Verification
  # scope module: 'users': will generate the path without /users, but with
  # the child controllers in the users folder

  get '/verify_clinician' => 'clinicians#verify', as: :verify_clinician
  get '/verify_patient' => 'patients#verify', as: :verify_patient

  #patient sessions
  get '/patient_log_in' => 'sessions#new_patient', as: :patient_log_in
  post '/patient_logs_in' => 'sessions#create_patient', as: :patient_logs_in

  # clinician sessions
  get '/clinician_log_in' => 'sessions#new_clinician', as: :clinician_log_in
  post '/clinician_logs_in' => 'sessions#create_clinician', as: :clinician_logs_in

  delete 'logout' => 'sessions#destroy', :as => 'logout'

end
