# == Schema Information
#
# Table name: public.companies
#
#  id         :bigint           not null, primary key
#  name       :string           default(""), not null
#  subdomain  :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_companies_on_subdomain  (subdomain) UNIQUE
#
class Company < ApplicationRecord

  # Relations

  # Validations

  # Callbacks

  # Delegates

  # Scopes

  # Methods
end
