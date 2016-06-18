class OriController < ApplicationController
  def index
    @ori_cards = Card.where(set: 'ORI').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end
end
