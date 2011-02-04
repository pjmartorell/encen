Encen::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # The production environment is meant for finished, "live" apps.
  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # For nginx:
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'

  # If you have no front-end server that supports something like X-Sendfile,
  # just comment this out and Rails will serve the files

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Disable Rails's static asset server
  # In production, Apache or nginx will already do this
  config.serve_static_assets = false

  # Enable serving of images, stylesheets, and javascripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Disable delivery errors, bad email addresses will be ignored
  config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  config.middleware.use ExceptionNotifier,
    :email_prefix => "[Notifier-#{APP_CONFIG['name']}]",
    :sender_address => APP_CONFIG['exception_notification_sender'],
    :exception_recipients => [APP_CONFIG['exception_notification_recipient']]

  config.middleware.insert_before(Rack::Lock, Rack::Rewrite) do
    r301 '/CARGA_LIGERA.html', '/cargaligera'
    r301 '/Donde_estamos_-_Direccion.html', '/contact'
    r301 '/carpinteria-metalica/mamparas-de-bano.html', '/mamparas'
    r301 '/carpinteria-metalica/mosquiteras.html', '/mosquiteras'
    r301 '/carpinteria-metalica/porticon.html', '/porticon'
    r301 '/carpinteria-metalica/techos.html', '/techos'
    r301 '/est_gran_carga.html', '/cargagrande'
    r301 '/est_media_carga.html', '/cargamedia'
    r301 '/estanteria.html', '/estanterias'
    r301 '/imagenes/carpinteria.swf', '/carpinteria'
    r301 '/porticones.html', '/porticon'
    r301 '/reja.html', '/rejas'
    r301 '/tipos_toldos.html', '/toldos'
    r301 '/toldo.html', '/t_stor'
  end
end
