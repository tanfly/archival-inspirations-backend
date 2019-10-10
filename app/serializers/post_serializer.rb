class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :photo, :title, :description, :favorites, :time_period :user, :tags
  has_many :favorites
  belongs_to :user
end
