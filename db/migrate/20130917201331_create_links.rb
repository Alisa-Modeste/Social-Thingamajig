class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :post_id, null: false, index: true
      t.string :url, null: false


      t.timestamps
    end
  end
end
