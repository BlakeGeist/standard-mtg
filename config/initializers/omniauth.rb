require 'certified'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ebay, "Blake_Geist-BlakeGei-standa-oysusnr", "a036b866-4e0d-49de-b7f6-a45309064be2", "	BlakeGei-standard-PRD-ee6e394ea-800e1243", "PRD-bff3fe44f0ea-09ae-470f-9222-6e2c", "0", :production, "SingleSignOn"
end
