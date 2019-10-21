class RemoveCountFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :count
  end
end
