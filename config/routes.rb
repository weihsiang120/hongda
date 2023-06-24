# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#home'
  resources :products do
    resources :pictures, only: [:destroy], module: :products
  end
  get '/about', to: 'products#about'
  get '/contact', to: 'products#contact'
end
