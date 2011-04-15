class PageContent < ActiveRecord::Base
  belongs_to :page
  validates_presence_of :url
  validates_presence_of :locale
  validates_uniqueness_of :url
  validates_uniqueness_of :locale, :scope => :page_id

  delegate :key, :to => :page
end
