class CardsController < ApplicationController


def index

  @soi_cards = Card.where(set: 'SOI').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 10)

  @w16_cards = Card.where(set: 'W16').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 10)

  @ogw_cards = Card.where(set: 'OGW').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 10)

  @bfz_cards = Card.where(set: 'BFZ').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 10)

  @ori_cards = Card.where(set: 'ORI').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 10)

  @dtk_cards = Card.where(set: 'DTK').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 10)


  @standard = [
    ['Shadows over Innistrad', @soi_cards, soi_index_path],
    ['Welcome Deck 2016', @w16_cards, w16_index_path],
    ['Oath of the Gatewatch', @ogw_cards, ogw_index_path],
    ['Battle for Zendikar', @bfz_cards, bfz_index_path],
    ['Magic Origins', @ori_cards, ori_index_path],
    ['Dragons of Tarkir', @dtk_cards, dtk_index_path]
  ]

  respond_to do |format|
    format.js
    format.html
  end

 end

 def show
   @card = Card.find(params[:id])
 end

 def new
   @card = Card.new
 end

 def edit
   @card = Card.find(params[:id])
 end

 def create
   @card = Card.new(card_params)

   if @card.save
     redirect_to @card
   else
     render 'new'
   end
 end

 def update
   @card = Card.find(params[:id])

   if @card.update(card_params)
     redirect_to @card
   else
     render 'edit'
   end
 end

 def destroy
   @card = Card.find(params[:id])
   @card.destroy

   redirect_to cards_path
 end

 private
   def card_params
     params.require(:card).permit(:info)
   end
end
