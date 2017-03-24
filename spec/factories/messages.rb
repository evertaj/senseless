# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_messages_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :message do
    content "MyText"
  end
end
