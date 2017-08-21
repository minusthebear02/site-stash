ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.mailgun.org',
  port: '587',
  authentication: :plain,
  user_name: ENV["ACTION_MAILER_USERNAME"],
  password: ENV["ACTION_MAILER_PASSWORD"],
  domain: 'https://site-stash.herokuapp.com/',
  enable_starttls_auto: true,
  content_type: 'text/html'
}

ActionMailer::Base.raise_delivery_errors = true
