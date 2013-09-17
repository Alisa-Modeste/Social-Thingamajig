class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id, null: false, index: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
