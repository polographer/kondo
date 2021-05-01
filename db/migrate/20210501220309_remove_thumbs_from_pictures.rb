class RemoveThumbsFromPictures < ActiveRecord::Migration[6.1]
  def change
    remove_column :pictures, :thumb200, :string
    remove_column :pictures, :thumb400, :string
    remove_column :pictures, :thumb800, :string
  end
end
