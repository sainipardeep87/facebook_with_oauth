class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :password
      t.string :password_digest
      t.string :email
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string :token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
