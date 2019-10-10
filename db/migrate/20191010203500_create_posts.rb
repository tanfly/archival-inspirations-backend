class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :photo
      t.string :title
      t.text :description
      t.integer :likes
      t.string :time_period
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
