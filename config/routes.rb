# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'static#index'
  resources :products do
    resources :reviews
  end
  get '/admin_page' => 'admin#users'
  get '/edit_user/:id' => 'admin#edit_user'
end
