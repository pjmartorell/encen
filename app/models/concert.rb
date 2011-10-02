class Concert < ActiveRecord::Base
  validates_presence_of :date
  validates_presence_of :city
  validates_presence_of :place
  
  default_scope order('date asc')
  scope :pending, where("date >= ?", Time.now()-2.day).order('date asc')
end
