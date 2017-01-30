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

require 'spec_helper'

FactoryGirl.define do
  factory :post do
    it 'is named Five'
  end
end
