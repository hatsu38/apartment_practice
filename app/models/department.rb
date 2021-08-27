# == Schema Information
#
# Table name: departments
#
#  id         :bigint           not null, primary key
#  name       :string
#  company_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Department < ApplicationRecord

  # Relations
  belongs_to :company
  has_many :employees

  # Validations

  # Callbacks

  # Delegates

  # Scopes

  # Methods
end
