Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '275341545839773', 'd5ab23cf902cbdbb7aa27c86c901d03d'
#  provider :facebook, '130026253769175', '086c42803d07d5c4dc70b4a937b99fee'
end