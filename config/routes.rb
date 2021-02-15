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
    resource :recipe_pdf, only: :show
  end

  resource :dashboard, only: :show, as: :dashboard

  resources :u, param: :username, controller: :users, as: :user do
    resources :collections, except: :index do
      resource :collection_status, only: :update, as: :status
      resource :collection_pdf, only: :show
    end
  end
end
