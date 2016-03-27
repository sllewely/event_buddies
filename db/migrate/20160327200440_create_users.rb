class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :access_token
      t.string :string
      t.string :temp_token
      t.string :email
      t.datetime :birthday
      t.string :first_name
      t.string :last_name
      t.string :uuid

      t.timestamps null: false
    end
  end
end
