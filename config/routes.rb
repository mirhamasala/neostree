Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :recipes, except: :index do
    resources :steps do
      resource :step_position, only: :update
    end
    resources :measures do
      resource :measure_position, only: :update
    end
    resource :recipe_status, only: [:update], as: :status
  end
  resource :dashboard, only: :show, as: :dashboard
  resources :users, param: :username, only: :show
end
