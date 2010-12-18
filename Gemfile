source 'http://rubygems.org'

gem 'rails', '~> 3.0.0'
gem 'i18n', "~> 0.5.0"

gem 'devise'
gem 'ya2yaml'
gem 'compass', "~> 0.10.6"
gem 'haml-rails'
gem 'jammit'

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'rspec-rails'
end

group :production, :staging do
  gem 'mysql2'
end

group :production do
  gem 'exception_notification'
end
