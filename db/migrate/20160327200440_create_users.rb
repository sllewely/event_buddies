class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :access_token
      t.string :temp_token, null: false
      t.string :email, null: false, index: true
      t.datetime :birthday
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :facebook_uid, null: false
      t.string :location
      t.string :uuid, null: false

      t.timestamps null: false
    end
  end
end
