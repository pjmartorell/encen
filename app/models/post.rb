class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :images, :dependent => :destroy

  validates_presence_of :title
  validates_presence_of :body, :on => :update
  validates_presence_of :date

  def to_s
    title
  end
end
