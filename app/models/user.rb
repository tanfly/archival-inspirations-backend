class User < ApplicationRecord
    has_secure_password
    has_many :favorites, dependent: :destroy
    has_many :posts, through: :favorites, dependent: :destroy
    has_many :posts, dependent: :destroy
    validates_presence_of :email, :username
    validates_uniqueness_of :email, :username
end
