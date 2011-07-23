
User.delete_all
puts "Creating users..."
User.create! :login => "admin", :password => "password", :password_confirmation => "password", :email => "admin@admin.net"

puts "Resetting posts and comments..."
Post.delete_all
Comment.delete_all

Page.delete_all
PageContent.delete_all

puts "Creating /cucota dynamic page"
page = Page.create! :key => :cucota
PageContent.create! :page => page, :locale => "ca", :url => "cucota"
puts "Done!"
