# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  after_create_commit { BroadcastMessageJob.perform_later self }
end
