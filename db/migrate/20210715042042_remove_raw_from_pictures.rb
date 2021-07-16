class RemoveRawFromPictures < ActiveRecord::Migration[6.1]
  def change
    remove_column :pictures, :raw, :boolean
  end
end
