class ExcludedSubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? &&
      !Apartment::Elevators::Subdomain.excluded_subdomains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "companies#index"
  require 'sidekiq/web'
  resources :companies, only: [:index, :new, :create]
  namespace :api do
    resources :health_check, only: :index
  end
  constraints ExcludedSubdomainConstraint do
    mount Sidekiq::Web, at: "/sidekiq"
    resources :departments, only:[:index, :new, :create]
    resources :employees, only:[:index, :new, :create]
  end
end
