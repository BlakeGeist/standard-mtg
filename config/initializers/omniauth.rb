Rails.application.config.middleware.use OmniAuth::Builder do
   provider :ebay, "runame", "devid", "appid", "certid", "siteid", "environment", "auth_type"
end
