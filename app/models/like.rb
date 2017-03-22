# == Schema Information
#
# Table name: likes
#
#  id      :integer          not null, primary key
#  post_id :integer
#  user_id :integer
#
# Indexes
#
#  index_likes_on_user_id_and_post_id  (user_id,post_id) UNIQUE
#

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
