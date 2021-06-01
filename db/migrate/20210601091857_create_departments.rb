class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.bigint :company_id, null: false

      t.timestamps
    end
  end
end
