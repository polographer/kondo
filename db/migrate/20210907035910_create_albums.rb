class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.boolean :dynamic
      t.string :rules

      t.timestamps
    end
  end
end
