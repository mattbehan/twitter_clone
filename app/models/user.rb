class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  after_create {
    Profile.create(user_id: self.id)
  }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true
  validates :handle, presence: true
  validates :handle, uniqueness: true

  has_many :tweets, dependent: :delete_all
  has_many :followings_following, class_name: :Following, foreign_key: :following_user_id, inverse_of: :following_user
  has_many :followings_followers, class_name: :Following, foreign_key: :followed_user_id, inverse_of: :followed_user
  has_many :users_followed, through: :followings_following, source: :followed_user, dependent: :delete_all
  has_many :users_followers, through: :followings_followers, source: :following_user, dependent: :delete_all

  has_many :blockings, dependent: :delete_all
  has_many :blockings_blocked_users, class_name: :Blocking, foreign_key: :blocked_user_id

  has_many :blocked_users, through: :blockings
  has_many :users_blocked_by, through: :blockings_blocked_users, source: :user

  has_one :profile

  has_many :messagee, foreign_key: :receiver_id, class_name: 'Message'  
  has_many :senders, through: :messagee
  has_many :messaged, foreign_key: :sender_id, class_name: 'Message'
  has_many :receivers, through: :messaged

  # these are all really just helper methods
  def follows? target_user
    users_followed.include?(target_user)
  end

  def blocked?
    blocked_users.include?(target_user)
  end

  def follow target_user
    users_followed << target_user
  end

  def block target_user
    blocked_users << target_user
  end

  def timeline
    # Tweet.where("user_id IN (?) OR user_id = ?", users_followed_ids, id)
    Tweet.includes(user: [:profile]).where(user_id: users_followed_ids << id)
  end

end
