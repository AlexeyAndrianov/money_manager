OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '166897257168352', '6a204f8c3afc906a81e7a9384267fe01'
end
