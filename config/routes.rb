Rails.application.routes.draw do
  resources :images
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "pictures#index"

  resources :pictures do
    resources :comments, only: [:create, :destroy, :show]
  end
end
