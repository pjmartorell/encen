source 'http://rubygems.org'

gem 'rails', '~> 3.0.20'
gem 'i18n', "~> 0.5.0"
gem 'nokogiri'

gem 'devise', :git => 'git://github.com/plataformatec/devise.git'
gem 'compass', "~> 0.10.6"
gem 'haml-rails'

gem 'simple_form'
gem 'heroku'

gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'sass'

gem 'hominid'
gem 'humanizer'
gem 'will_paginate', '~> 3.0.0'
gem 'taps'
gem "lazyhash"

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'rspec-rails'
  gem 'ruby-debug'
end

group :production, :staging do
  gem 'mysql2'
  gem "exception_notification", :git => "http://github.com/rails/exception_notification.git", :require => 'exception_notifier'
end
