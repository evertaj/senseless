class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :most_recent, -> { order(created_at: :desc) }

  belongs_to :user
  has_many :comments, dependent: :destroy

  def should_generate_new_friendly_id?
    title_changed?
  end
end
