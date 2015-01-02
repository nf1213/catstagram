class Post < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :posts

  has_many :meows,
    dependent: :destroy,
    inverse_of: :post

  validates :user, presence: true
  validates :image, presence: true
  validates :description, length: { maximum: 140 }

  mount_uploader :image, PostImageUploader

  def self.by_recency
    order(created_at: :desc)
  end

  def has_meow_from?(user)
    meow_from(user).present?
  end

  def meow_from(user)
    meows.find_by(user_id: user.id)
  end
end
