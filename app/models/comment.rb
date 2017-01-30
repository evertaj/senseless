# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  user_id    :integer
#  text       :string
#  approved   :boolean          default("false")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user

    scope :most_recent, -> { order(created_at: :desc) }
    
end
