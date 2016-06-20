class SoiController < ApplicationController
  def index
    @title="Shadows over Innistrad Card List"
    @soi_cards = Card.where(set: 'SOI').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end
end
