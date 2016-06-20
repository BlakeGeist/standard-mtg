class BfzController < ApplicationController
  def index
    @title="Battle for Zendikar Card List"
    @bfz_cards = Card.where(set: 'BFZ').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end
end
