class Post < ActiveRecord::Base
  belongs_to :user

  def to_s
    title
  end
end
