class Post < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :users, through: :favorites, dependent: :destroy

    validates_presence_of :title, :description
end
