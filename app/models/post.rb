class Post < ApplicationRecord
    Gutentag::ActiveRecord.call self
    belongs_to :user, dependent: :destroy
    has_many :favorites
    has_many :user_favorites, through: :favorites

    validates_presence_of :title, :description
end
