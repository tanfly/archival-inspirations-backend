class User < ApplicationRecord
    has_secure_password
    has_many :favorites, dependent: :destroy
    has_many :posts, through: :favorites, dependent: :destroy
    has_many :posts, dependent: :destroy
    validates_presence_of :email, :username
    validates_uniqueness_of :email, :username

    
    def favorite(post)
        Favorite.where(:user_id => self.id, :post => post).first_or_create
    end
    
    def unfavorite(post)
        Favorite.where(post: post).destroy_all
        post.reload
    end

    def favorited?(post)
       Favorite.find_by(post_id: post.id).present?
    end
end
