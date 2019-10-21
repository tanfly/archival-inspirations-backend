class AddCountToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :count, :integer
  end
end
