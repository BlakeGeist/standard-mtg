class EbayController < ApplicationController

  def index

    @title = "Ebay Dashboard"

    require 'ebayr'

    Ebayr.dev_id = "a036b866-4e0d-49de-b7f6-a45309064be2"

    Ebayr.app_id = "BlakeGei-standard-PRD-ee6e394ea-800e1243"

    Ebayr.cert_id = "PRD-bff3fe44f0ea-09ae-470f-9222-6e2c"

    Ebayr.ru_name = "Blake_Geist-BlakeGei-standa-oysusnr"

    Ebayr.sandbox = false


    @GetOrders = Ebayr.call(:GetMyeBaySelling, :auth_token => session["dick"]["info"]["ebay_token"], :ActiveList => [:Sort => 'TimeLeft', :Pagination => [:EntriesPerPage => 200, :PageNumber => 1]])

    respond_to do |format|
      format.js
      format.html
    end

  end

end
