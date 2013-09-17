class CreateCircleMemberships < ActiveRecord::Migration
  def change
    create_table :circle_memberships do |t|
      t.integer :circle_id, null: false, index: true
      t.integer :circle_member_id, null: false, index: true

      t.timestamps
    end
  end
end
