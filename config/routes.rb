Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :recipes, except: :index do
    resources :steps, only: %i[new create] do
      member do
        patch :move
      end
    end
    resources :measures, only: %i[new create] do
      member do
        patch :move
      end
    end
  end
  resources :steps, only: [:destroy]
  resources :measures, only: [:destroy]
  resources :units, only: %i[new create destroy]
  resources :ingredients, only: %i[new create destroy]
  resource :dashboard, only: :show, as: :dashboard
end
