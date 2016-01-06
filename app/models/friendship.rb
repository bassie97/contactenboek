class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  has_many :messages, dependent: :destroy
  validates :friend, presence: true, uniqueness: { scope: :user_id, message: ->(error, values) { "#{values[:value].name} is al een maatje" } }
end
