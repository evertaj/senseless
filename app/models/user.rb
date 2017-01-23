class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
  mount_uploaders :avatars, AvatarUploader

  def own?(post)
    id == post.user_id
  end

  def is_admin?
    email == 'overroy@mail.ru'
  end

end
