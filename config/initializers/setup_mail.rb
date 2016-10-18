ActionMailer::Base.smtp_settings = {
  address:              ENV['EMAIL_SERVER'],
  # port:                 "587",
  # port:                 '465',
  port:                 ENV["EMAIL_PORT"],
  enable_starttls_auto: ENV['EMAIL_TLS_AUTO'],
  authentication:       ENV['EMAIL_AUTHENTICATION'],
  user_name:            ENV["EMAIL_USER_NAME"],
  password:             ENV["EMAIL_PASSWORD"]
}
