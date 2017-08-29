class Bookmark < ActiveRecord::Base
  belongs_to :topic
  delegate :user, to: :bookmark
  has_many :likes, dependent: :destroy
end
