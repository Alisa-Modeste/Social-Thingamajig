class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.integer :owner_id, null: false, index: true

      t.timestamps
    end
  end
end
