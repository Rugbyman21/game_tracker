class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.column :name, :string
      t.column :country, :string
      t.column :city, :string
      t.column :address, :string
      t.column :zip, :integer

      t.timestamps
    end
  end
end
