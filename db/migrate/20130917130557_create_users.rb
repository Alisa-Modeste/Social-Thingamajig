class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null:false, index:true, uniqueness: true
      t.string :password_digest, null:false
      t.string :session_token, null:false, index:true, uniqueness: true

      t.timestamps
    end
  end
end
