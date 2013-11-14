# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Depot::Application.initialize!
# Configuration for sending email
Depot::Application.configure do
  config.action_mailer.delivery_method = :smtp

  # Typical Gmail settins
  config.action_mailer.smtp_settings = {
    address:  "smtp.gmail.com",
    port:  587,
    domain: "gmail.com",
    authentication: "plain",
    user_name: "karina.simpson",
    password: "ParaisoMy7303",
    enable_starttls_auto: true
  }
end
