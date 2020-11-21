Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'

  %w[404 422 500].each do |code|
    get code, to: 'errors#show', code: code
  end

  resources :recipes, except: :index do
    resources :steps do
      resource :step_position, only: :update
    end
    resources :measures do
      resource :measure_position, only: :update
    end
    resource :recipe_status, only: :update, as: :status
  end

  resource :dashboard, only: :show, as: :dashboard

  resources :u, param: :username, only: :show, controller: :users, as: :user do
    resources :collections, except: :update
  end
end
