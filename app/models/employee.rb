# == Schema Information
#
# Table name: employees
#
#  id            :bigint           not null, primary key
#  name          :string(255)      default(""), not null
#  department_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_employees_on_department_id  (department_id)
#
# Foreign Keys
#
#  fk_rails_...  (department_id => departments.id)
#
class Employee < ApplicationRecord

  # Relations
  belongs_to :department
  # Validations

  # Callbacks

  # Delegates

  # Scopes

  # Methods
end
