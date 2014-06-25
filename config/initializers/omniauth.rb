OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '571282879561414', '9caee748de8e7a3cf3f50e3beb1360f2'
end