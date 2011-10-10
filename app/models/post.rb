class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :images, :as => :owner, :dependent => :destroy

  validates_presence_of :title
  validates_presence_of :body, :on => :update
  validates_presence_of :date

  before_save :update_published_at
  default_scope order('created_at desc')
  
  scope :published, where(:published => true).order("published_at DESC")  #TODO

  self.per_page = 3

  def to_s
    title
  end
  
  def to_param
    permlink = self.title.mb_chars.normalize(:kd).strip.gsub(/[^\x00-\x7F]/n,'').gsub!(/\ /,'-').gsub!(/!/,'').downcase.to_s
    "#{self.id}-#{permlink}"
  end

  def update_published_at
    if published_changed? && !published_was && published
      self.published_at = Time.now
    end
  end
end
