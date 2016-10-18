ActionMailer::Base.smtp_settings = {
  address:              "smtp.gmail.com",
  port:                 "587",
  # port:                 '465',
  enable_starttls_auto: true,
  authentication:       :plain,
  user_name:            ENV["EMAIL_USER_NAME"],
  password:             ENV["EMAIL_PASSWORD"]
}
