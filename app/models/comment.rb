require "resolv"

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  before_save :check_email

  def check_email
    unless email.blank?
      unless email =~ /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/
          errors.add(:email, "Your email address does not appear to be valid")
      else
        errors.add(:email, "Your email domain name appears to be incorrect") unless validate_email_domain(email)
      end
    end
  end
end
