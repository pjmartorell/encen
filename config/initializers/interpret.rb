Interpret.configure do |config|
  config.parent_controller = 'admin/admin_controller'
  config.scope = "(:locale)"
  config.sweeper = "static_sweeper"
end
