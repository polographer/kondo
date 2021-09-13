class CreateAppareances < ActiveRecord::Migration[6.1]
  def change
    create_table :appareances do |t|
      t.references :picture, null: false, foreign_key: true
      t.references :people, null: false, foreign_key: true

      t.timestamps
    end
  end
end
