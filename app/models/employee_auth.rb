# frozen_string_literal: true

# == Schema Information
#
# Table name: employee_auths
#
#  id                     :bigint           not null, primary key
#  employee_id            :bigint           not null
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  email                  :string
#  tokens                 :json
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_employee_auths_on_confirmation_token    (confirmation_token) UNIQUE
#  index_employee_auths_on_email                 (email) UNIQUE
#  index_employee_auths_on_employee_id           (employee_id)
#  index_employee_auths_on_reset_password_token  (reset_password_token) UNIQUE
#  index_employee_auths_on_uid_and_provider      (uid,provider) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#
class EmployeeAuth < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
