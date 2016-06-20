class DtkController < ApplicationController
  def index
    @title="Dragons of Tarkir Card List"
    @dtk_cards = Card.where(set: 'DTK').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end
end
