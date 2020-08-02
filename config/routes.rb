Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'

  resources :recipes, except: :index do
    resources :steps do
      resource :step_position, only: :update
    end
    resources :measures, only: %i[new create] do
      resource :measure_position, only: :update
    end
  end
  resources :steps, only: [:destroy]
  resources :measures, only: [:destroy]
  resources :units, only: %i[new create destroy]
  resources :ingredients, only: %i[new create destroy]
  resource :dashboard, only: :show, as: :dashboard
end
