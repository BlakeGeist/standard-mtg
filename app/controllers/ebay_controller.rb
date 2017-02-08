class EbayController < ApplicationController

  def index

    @title = "Ebay Dashboard"

    respond_to do |format|
      format.js
      format.html
    end

  end

end
