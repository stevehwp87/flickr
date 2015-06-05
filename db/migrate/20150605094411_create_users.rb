class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :email
      u.string :password
      u.string :username
      u.timestamp
    end
  end
end
