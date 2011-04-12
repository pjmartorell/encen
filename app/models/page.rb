class Page < ActiveRecord::Base
  has_many :page_contents

  validates :key, :presence => true, :uniqueness => true
end
