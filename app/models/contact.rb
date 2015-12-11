class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses,
                                allow_destroy: true

  validates :name, presence: true
  validates :email, :email => true
  validates :email, uniqueness: {:scope => :user_id}


  mount_uploader :avatar, AvatarUploader

  scope :query, -> (q) {where('name LIKE :query OR email LIKE :query', query: "%#{q}%")}
end
