require 'certified'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ebay, "Blake_Geist-BlakeGei-standa-bvslpr", "a036b866-4e0d-49de-b7f6-a45309064be2", "BlakeGei-standard-SBX-5e6e394ea-29d730e6", "SBX-e6e394ea763e-b466-4f1c-9f4e-f991", "0", :sandbox
end
