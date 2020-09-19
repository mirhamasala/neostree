Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'

  resources :recipes, except: :index do
    resources :steps do
      resource :step_position, only: :update
    end
    resources :measures do
      resource :measure_position, only: :update
    end
    resources :recipe_statuses, only: [:update], as: :status
  end
  resource :dashboard, only: :show, as: :dashboard
end
