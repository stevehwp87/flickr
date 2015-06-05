class CreateAlbums < ActiveRecord::Migration
  def change
       create_table :albums do |u|
      u.string :name
      u.integer :user_id
      u.timestamp
    end
  end
end
