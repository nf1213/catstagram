class CreateMeows < ActiveRecord::Migration
  def change
    create_table :meows do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end

    add_index :meows, [:post_id, :user_id], unique: true
  end
end
