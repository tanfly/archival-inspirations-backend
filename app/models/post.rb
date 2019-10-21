class Post < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :users, through: :favorites, dependent: :destroy

    validates_presence_of :title, :description

    scope :authored_by, ->(username) { where(user: User.where(username: username)) }
    scope :favorited_by, -> (username) { joins(:favorites).where(favorites: { user: User.where(username: username) }) }
end
