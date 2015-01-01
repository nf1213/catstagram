class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image
      t.integer :user_id
      t.text :description

      t.timestamps null: false
    end
  end
end
