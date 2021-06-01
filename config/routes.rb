class ExcludedSubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? &&
      !Apartment::Elevators::Subdomain.excluded_subdomains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "companies#index"
  resources :companies, only: [:index, :new, :create]

  constraints ExcludedSubdomainConstraint do
    resources :departments, only:[:index, :new, :create]
  end
end
