class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :contacts, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :friendships
  has_many :friends, :through => :friendships

  accepts_nested_attributes_for :addresses,
                                allow_destroy: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  scope :query, -> (q, user) {where('name LIKE :query OR email LIKE :query', query: "%#{q}%").where.not(id: user.id).take(10)}#where.not(id: user.friends.map(&:id)).take(10)}
end
