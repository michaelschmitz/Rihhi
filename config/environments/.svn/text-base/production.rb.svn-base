# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

Paperclip.options[:command_path] = '/opt/local/bin'

# Enable threaded mode
# config.threadsafe!

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true

# Use a different cache store in production
# config.cache_store = :mem_cache_store

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = true

#Mails can be send (using the :smtp) or not send (using the :test), also generall shutoff possible via :true/:false in perform deliveries.
config.action_mailer.delivery_method = :smtp
config.action_mailer.perform_deliveries = :true

#Configuring email sending -> this is the same for all environments
config.action_mailer.default_charset = "utf-8"
config.action_mailer.smtp_settings = {
  :address => "smtp.1und1.de",
  :port   => 25,
  :domain => "www.artefact-consulting.com",
  :authentication => :login,
  :user_name => "registration@artefact-consulting.com",    #This works, message does show "from" address, not this one
  :password => "themailingdaemon"                           #Don't change this
}
