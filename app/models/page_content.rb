class PageContent < ActiveRecord::Base
  belongs_to :page
  validates_presence_of :url
  validates_presence_of :locale
  validates_uniqueness_of :url

  delegate :key, :to => :page
end
