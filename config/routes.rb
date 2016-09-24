Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  resources :abouts, only: [:index]

  resources :clinicians do
    resources :patients, only: [:index, :show]
  end

  namespace :clinicians do
    resources :sessions, only: [:new, :create] do
      delete :destroy, on: :collection
    end
  end

  resources :patients do
    resources :clinicians, only: [:show]
  end

  namespace :patients do
    resources :sessions, only: [:new, :create] do
      delete :destroy, on: :collection
    end
  end
end
