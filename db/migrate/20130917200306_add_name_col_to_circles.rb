class AddNameColToCircles < ActiveRecord::Migration
  def change
    add_column :circles, :name, :string, uniqueness: {scope: :owner_id}
  end
end
