class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :avatar, :favorites, :posts
  has_many :favorites
  has_many :posts
end
