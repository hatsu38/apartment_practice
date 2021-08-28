class CreateEmployeeProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_profiles do |t|
      t.string :name, null: false, default: ""
      t.references :employee, foreign_key: true, null: false
      t.references :department, foreign_key: true, null: false

      t.timestamps
    end
  end
end
