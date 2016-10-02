module ApplicationHelper

  require 'ebay_client'

  def test_ebay

    user_t = {:appID=>'BlakeGei-standard-SBX-5e6e394ea-29d730e6'}

    EbayClient.api.get_session_id!(user_t[:appID])

  end

end
