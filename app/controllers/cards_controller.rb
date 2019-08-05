class CardsController < ApplicationController

def index

  $colors = Color.all
  $mechanics = Mechanic.all
  $subtypes = Subtype.all
  $rarities = Crarity.all
  #$standard = Standard.all

  if user_signed_in? and current_user.pcards
    @users_cards = current_user.pcards.pluck(:card_id)
  end

  @title ="Standard MTG Card List | Standard MTG Cards"
  @search = Card.all.ransack(params[:q])
  @the_cards = @search.result(distinct: true).where.not("type_line like?", "%Basic Land%")
  @cards = @the_cards.sort_by{ |t| [t.colors.count, t.cmc.to_i, t.name.to_s] }.paginate(:page => params[:page], :per_page => 30)
  @cardsd = Card.last(5)
  @this_thing =  $standard.map(&:short_name)

  respond_to do |format|
    format.js
    format.html
  end

 end


 def show
   @card = Card.friendly.find(params[:id])
   @latest_price = @card.tcg_prices.last
   @card_prices = @card.tcg_prices.last(5)
   @title="#{@card.name} is in Standard | Standard MTG Cards"

   unless @card.oracle_text.nil?
     if @card.oracle_text =~ /(?:\n\r?|\r\n?)/
       @card_text = @card.oracle_text.gsub(/(?:\n\r?|\r\n?)/, '<br /> <br />')
     else
       @card_text = @card.oracle_text
     end
     if @card_text.include? ("(")
       @card_text = @card_text.gsub('(', '<em>(')
       @card_text = @card_text.gsub(')', ')</em>')
     end
   end

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

   redirect_to dashboard_path
 end

 private
   def card_params
     params.require(:card).permit(:info, :aveprice, :hiprice, :lowprice, :foilprice, :link)
   end
end
