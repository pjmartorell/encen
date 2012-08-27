require "resolv"

class Comment < ActiveRecord::Base
  belongs_to :post
  include Humanizer
  require_human_on :create
    
  validates_presence_of :name
  validates :email, :allow_blank => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  #validate :is_valid_email?
  validates_presence_of :body
  validates_presence_of :humanizer_answer

  default_scope order('created_at asc')

private
  def is_valid_email?
    unless email.blank?
      unless email =~ /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/
          errors.add(:comment, "Your email address does not appear to be valid")
      else
        errors.add(:comment, "Your email domain name appears to be incorrect") unless validate_email_domain(email)
      end
    end
  end

  def validate_email_domain(email)
      domain = email.match(/\@(.+)/)[1]
      Resolv::DNS.open do |dns|
          @mx = dns.getresources(domain, Resolv::DNS::Resource::IN::MX)
      end
      @mx.size > 0 ? true : false
  end
  
end
