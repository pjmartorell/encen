class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

  validates :login, :presence => true, :uniqueness => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :password_confirmation, :login, :remember_me, :email

  has_many :posts
  has_many :comments

  def email_required?
    false
  end

  def to_s
    login
  end

protected
  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end
end
