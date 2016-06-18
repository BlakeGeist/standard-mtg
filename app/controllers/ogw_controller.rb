class OgwController < ApplicationController
  def index
    @ogw_cards = Card.where(set: 'OGW').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end
end
