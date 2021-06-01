# == Schema Information
#
# Table name: apartment_practice_development.companies
#
#  id         :bigint           not null, primary key
#  name       :string(255)      default(""), not null
#  subdomain  :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_companies_on_subdomain  (subdomain) UNIQUE
#
class Company < ApplicationRecord
end
