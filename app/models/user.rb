class User < ActiveRecord::Base
  extend Devise::Models

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:nickname]
  include DeviseTokenAuth::Concerns::User

  has_many :posts
  has_many :comments
  has_many :reactions

  validates :email, uniqueness: true, presence: true
  validates :nickname, uniqueness: true, presence: true

  before_save :set_uid

  private
    def set_uid
      self.uid = self.nickname
    end
end
