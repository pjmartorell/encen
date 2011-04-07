Interpret.configure do |config|
  config.parent_controller = 'admin/admin_controller'
  config.scope = "(:locale)"
  config.current_user = "current_user"
  config.registered_envs << :development
end
