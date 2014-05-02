# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

Paperclip.options[:command_path] = 'C:\ImageMagick'   #Only relevant for win7, dev mode. Do not install ImageMagick in a directory with spaces!

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = true

#Mails can be send (using the :smtp) or not send (using the :test), also generall shutoff possible via :true/:false in perform deliveries.
config.action_mailer.delivery_method = :smtp
config.action_mailer.perform_deliveries = :false

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
