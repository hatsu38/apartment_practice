Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

  if Rails.env.development?
    post "/graphql", to: "graphql#execute"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "companies#index"
  require 'sidekiq/web'
  resources :companies, only: [:index, :new, :create] do
    resources :departments, only:[:index, :new, :create]
    resources :employees, only:[:index, :new, :create]
  end
  namespace :api do
    resources :health_check, only: :index
  end
  # constraints ExcludedSubdomainConstraint do
  mount Sidekiq::Web, at: "/sidekiq"
end
