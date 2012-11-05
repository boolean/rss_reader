class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :login, :email, :password, :password_confirmation, :remember_me, :avatar

  mount_uploader :avatar, AvatarUploader

  has_many :channels
  has_many :channel_articles, :through => :channels
end

