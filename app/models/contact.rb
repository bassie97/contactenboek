class Contact < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader
end
