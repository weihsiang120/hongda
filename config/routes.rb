# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#home'
  resources :products do 
    resources :pictures, only: [:destroy], module: :products
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
