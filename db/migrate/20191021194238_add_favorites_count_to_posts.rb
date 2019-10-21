class AddFavoritesCountToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :favorites_count, :integer
  end
end
