class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :contacts, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :messages



  accepts_nested_attributes_for :addresses,
                                allow_destroy: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  scope :query, -> (q, user) {where('name LIKE :query OR email LIKE :query', query: "%#{q}%")
                              .where.not(id: user.id)
                              .where.not(id: user.friends.map(&:id))
                              .where.not(id: user.inverse_friends.map(&:id)).take(10)}

end
