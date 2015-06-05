class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |u|
      u.string :file
      u.integer :album_id
      u.timestamp
    end
  end
end

