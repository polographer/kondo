class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :filename
      t.string :full_path
      t.references :path, null: false, foreign_key: true
      t.boolean :will_organize
      t.boolean :will_research
      t.string :extension
      t.boolean :raw
      t.timestamp :filesystem_date
      t.timestamp :picture_date
      t.string :size
      t.string :thumb200
      t.string :thumb400
      t.string :thumb800
      t.json :exif
      t.json :meta

      t.timestamps
    end
  end
end
