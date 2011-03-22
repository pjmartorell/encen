class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :assets

  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :date

  def to_s
    title
  end
end
