class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :user, :post
end
