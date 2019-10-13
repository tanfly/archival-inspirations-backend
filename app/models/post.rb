class Post < ApplicationRecord
    Gutentag::ActiveRecord.call self
    belongs_to :user, dependent: :destroy
    has_many :favorites
    has_many :users, through: :favorites

    validates_presence_of :title, :description
end
