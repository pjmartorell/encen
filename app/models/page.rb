class Page < ActiveRecord::Base
  has_many :page_contents
  has_many :images, :as => :owner, :dependent => :destroy

  validates :key, :presence => true, :uniqueness => true

  def has_all_locales?
    I18n.available_locales == page_contents.map{|x| x.locale.to_sym}
  end

  def to_s
    key
  end
end
