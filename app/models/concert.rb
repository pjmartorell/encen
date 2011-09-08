class Concert < ActiveRecord::Base
  validates_presence_of :date
  validates_presence_of :city
  validates_presence_of :place
  
  default_scope order('date asc')
end
