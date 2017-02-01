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
#
# Indexes
#
#  index_posts_on_slug  (slug) UNIQUE
#

require_relative '../spec_helper'

FactoryGirl.define do
  factory :post do
    title "How to read a book effectively"
    body  "There are five steps involved."
  end
end
