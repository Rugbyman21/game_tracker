class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.column :author, :string
      t.column :content, :string
      t.column :game_id, :integer

      t.timestamps
    end
  end
end
