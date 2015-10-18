class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.column :title, :string
      t.column :rating, :string
      t.column :genre_id, :integer
      t.column :company_id, :integer

      t.timestamps
    end
  end
end
