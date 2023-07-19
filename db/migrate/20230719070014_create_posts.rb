class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :comments_counter
      t.integer :likes_counter
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
