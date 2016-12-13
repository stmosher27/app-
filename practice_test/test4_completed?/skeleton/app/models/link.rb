class Link < ActiveRecord::Base
  validates :title, :url, :user_id, :user, presence: true

  belongs_to :user
  has_many :comments
end
