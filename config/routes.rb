Rails.application.routes.draw do
  root to: "recipes#index"

  resources :recipes, except: :index
  resources :units, only: [:new, :create, :destroy]
  resource :dashboard, only: :show, as: :dashboard
end
