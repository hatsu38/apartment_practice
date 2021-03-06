class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false, default: ""
      t.string :subdomain, null: false, default: ""

      t.timestamps
    end

    add_index :companies, [:subdomain], unique: true
  end
end
