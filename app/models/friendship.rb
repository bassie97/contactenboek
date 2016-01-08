class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User', :foreign_key => "friend_id"
  belongs_to :inverse_friend, class_name: 'User', :foreign_key => "user_id"
  has_many :messages, dependent: :destroy
  validate :users_are_not_already_friends
  # an example of how to get only the authorized friends
  scope :authorized, -> {where(authorized: true)}

  # an example of how to get only the unauthorized friends
  scope :unauthorized, -> {where(authorized: false)}

  def users_are_not_already_friends
    combinations = ["user_id = #{user_id} AND friend_id = #{friend_id}",
                    "user_id = #{friend_id} AND friend_id = #{user_id}"]
    if Friendship.where(combinations.join(' OR ')).exists?
      self.errors.add(:base, "#{friend.name} is al een maatje!")
    end
  end
end
