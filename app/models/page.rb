class Page < ActiveRecord::Base
  has_many :page_contents, :dependent => :destroy
  has_many :images, :as => :owner, :dependent => :destroy

  validates :key, :presence => true, :uniqueness => true
  default_scope order('created_at asc')
  
  def has_all_locales?
    I18n.available_locales == page_contents.map{|x| x.locale.to_sym}
  end

  def page_localizations_left
    I18n.available_locales - page_contents.map{|x| x.locale.to_sym}
  end

  def get_body
    content = page_contents.detect{|x| x.locale == I18n.locale.to_s} || page_contents.first
    content.body
  end

  def to_s
    key
  end
end
