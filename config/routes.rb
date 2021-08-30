Rails.application.routes.draw do
  mount_devise_token_auth_for 'EmployeeAuth', at: 'auth'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "companies#index"
  require 'sidekiq/web'
  resources :companies, only: [:index, :new, :create]

  resources :departments, only:[:index, :new, :create]
  resources :employees, only:[:index, :new, :create]

  namespace :api do
    resources :health_check, only: :index
  end
  # constraints ExcludedSubdomainConstraint do
  mount Sidekiq::Web, at: "/sidekiq"
end
