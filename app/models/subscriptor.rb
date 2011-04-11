class Subscriptor < ActiveRecord::Base
  before_create :set_token

private
  def set_token
    self.token = Digest::SHA1.new("#{email}#{rn816svbaqpq6vbzmq83hq}")
  end
end
