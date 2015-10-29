class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.string :nickname
      t.string :access_token

      t.timestamps null: false
    end
  end
end
