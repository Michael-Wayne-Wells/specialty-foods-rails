Rails.application.routes.draw do
  root to: 'static#index'
  resources :products do
    resources :reviews
  end
  get "/:page" => "static#show"
end
