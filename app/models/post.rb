# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  slug             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  banner_image_url :string
#  user_id          :integer
#  hidden           :boolean          default("false")
#  likes            :integer          default("0")
#
# Indexes
#
#  index_posts_on_slug  (slug) UNIQUE
#

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
