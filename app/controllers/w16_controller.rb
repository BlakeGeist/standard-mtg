class W16Controller < ApplicationController
  def index
    @title="Welcome Deck 2016 Card List"
    @w16_cards = Card.where(set: 'W16').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 21)
  end
end
