class BfzController < ApplicationController
  def index
    @bfz_cards = Card.where(set: 'BFZ').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end
end
