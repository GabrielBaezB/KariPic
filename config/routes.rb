Rails.application.routes.draw do
  resources :images

  # Agrupar las rutas personalizadas para Devise
  devise_scope :user do
    get '/login', to: 'users/sessions#new', as: :login
    # Agregar aquí otras rutas personalizadas de Devise si las tienes
  end

  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "pictures#index"

  resources :pictures do
    resources :comments, only: [:create, :destroy, :show]
  end
end
