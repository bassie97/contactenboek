class Contact < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses,
                                allow_destroy: true,
                                reject_if: lambda {|attributes| attributes['country'].blank?}
  validates :name, presence: true
  validates :email, :email => true


  mount_uploader :avatar, AvatarUploader

  scope :query, -> (q) {where('name LIKE :query OR email LIKE :query', query: "%#{q}%")}
end
