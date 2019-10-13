class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :photo, :title, :description, :favorites, :time_period, :user_id 
  has_many :favorites
  belongs_to :user
end
