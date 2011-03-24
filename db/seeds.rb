I18n.locale = :en

User.delete_all
puts "Creating users..."
User.create! :login => "admin", :password => "password", :password_confirmation => "password", :email => "admin@admin.net"

puts "Resetting posts and comments..."
Post.delete_all
Comment.delete_all

puts "Done!"
