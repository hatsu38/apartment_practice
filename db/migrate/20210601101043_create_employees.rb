class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name, null: false, default: ""
      t.references :department, foreign_key: true, null: false

      t.timestamps
    end
  end
end
