class User < ApplicationRecord
    has_secure_password
    has_many :favorite_posts, through: :favorites
    has_many :posts
    validates_presence_of :email, :username
    validates_uniqueness_of :email, :username
end