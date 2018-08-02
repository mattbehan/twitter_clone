class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true
  validates :handle, presence: true
  validates :handle, uniqueness: true

  has_many :tweets
  has_many :followings_following, class_name: :Following, foreign_key: :following_user_id, inverse_of: :following_user
  has_many :followings_followers, class_name: :Following, foreign_key: :followed_user_id, inverse_of: :followed_user
  has_many :users_followed, through: :followings_following, source: :followed_user
  has_many :users_followers, through: :followings_followers, source: :following_user

  has_many :blockings
  has_many :blockings_blocked_users, class_name: :Blocking, foreign_key: :blocked_user_id

  has_many :blocked_users, through: :blockings
  has_many :users_blocked_by, through: :blockings_blocked_users, source: :user

end
