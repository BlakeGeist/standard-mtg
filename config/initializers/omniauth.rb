require 'certified'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ebay, "Blake_Geist-BlakeGei-standa-oysusnr", "a036b866-4e0d-49de-b7f6-a45309064be2", "	BlakeGei-standard-PRD-ee6e394ea-800e1243", "PRD-e6e394ea35e2-df6c-47ae-a28e-25fa", "0", :production, "SignIn"
end
