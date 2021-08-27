# == Schema Information
#
# Table name: departments
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Department < ApplicationRecord

  # Relations
  has_many :employees

  # Validations

  # Callbacks

  # Delegates

  # Scopes

  # Methods
end
