Rails.application.routes.draw do
  root to: "recipes#index"

  resources :recipes, except: :index do
    resources :steps, only: [:new, :create]
    resources :measures, only: [:new, :create]
  end
  resources :steps, only: [:destroy]
  resources :units, only: [:new, :create, :destroy]
  resources :ingredients, only: [:new, :create, :destroy]
  resource :dashboard, only: :show, as: :dashboard
end
