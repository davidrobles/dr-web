class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.boolean :published, default: false

      t.timestamps
    end
    add_index :posts, :slug
    add_index :posts, :published
    add_index :posts, [:published, :created_at]
  end
end
