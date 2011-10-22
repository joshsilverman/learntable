Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '275341545839773', 'd5ab23cf902cbdbb7aa27c86c901d03d'
end