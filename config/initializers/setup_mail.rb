ActionMailer::Base.smtp_settings = {
  :address              => APP_CONFIG['mail']['smtp']['address'],
  :port                 => APP_CONFIG['mail']['smtp']['port'],

  :domain               => APP_CONFIG['mail']['domain'],
  :user_name            => APP_CONFIG['mail']['user_name'],
  :password             => APP_CONFIG['mail']['password'],
  :authentication       => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = APP_CONFIG['hostname']

