# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  city                   :string
#  bio                    :string
#  avatars                :json
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true
  validates_format_of :username, :with => /(?=\A[A-Za-z\d]([-\w]{,498}[A-Za-z\d])?\Z)(?!.*admin.*)/i

  has_many :posts, dependent: :destroy
  mount_uploaders :avatars, AvatarUploader

  def own?(post)
    id == post.user_id
  end

  def is_admin?
    email == 'overroy@mail.ru'
  end

end
