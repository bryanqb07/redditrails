class CreatePostTable < ActiveRecord::Migration[5.2]
  def change
    create_table :post do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :user_id, null: false 

      t.timestamps
    end
  end
end
