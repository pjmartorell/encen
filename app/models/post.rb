class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :images, :as => :owner, :dependent => :destroy

  validates_presence_of :title
  validates_presence_of :body, :on => :update
  validates_presence_of :date

  before_save :update_published_at

  scope :published, where(:published => true).order("published_at DESC")

  def to_s
    title
  end

  def update_published_at
    if published_changed? && !published_was && published
      self.published_at = Time.now
    end
  end
end
