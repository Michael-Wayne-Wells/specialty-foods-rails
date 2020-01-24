Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'static#index'
  resources :products do
    resources :reviews
  end
  get "/:page" => "static#show"
end
