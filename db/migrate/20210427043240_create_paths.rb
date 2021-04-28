class CreatePaths < ActiveRecord::Migration[6.1]
  def change
    create_table :paths do |t|
      t.string :location
      t.boolean :organize
      t.boolean :backup
      t.boolean :use_as_backup

      t.timestamps
    end
  end
end
