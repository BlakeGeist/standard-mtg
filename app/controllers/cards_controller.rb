class CardsController < ApplicationController

def index

  $colors = Color.all
  $mechanics = Mechanic.all
  $subtypes = Subtype.all
  $rarities = Crarity.all
  $standard = Standard.all

  if user_signed_in? and current_user.pcards
    @users_cards = current_user.pcards.pluck(:card_id)
  end

  @title ="Standard MTG Card List | Standard MTG Cards"
  @search = Card.where(set: $standard.map(&:short_name)).ransack(params[:q])
  @the_cards = @search.result(distinct: true).where.not("types like?", "%Land%")
  @cards = @the_cards.sort_by{ |t| [t.colors.count, t.cmc.to_i, t.name.to_s] }.paginate(:page => params[:page], :per_page => 28)

  @cardsd = Card.last(5)

  @this_thing =  $standard.map(&:short_name)

  respond_to do |format|
    format.js
    format.html
  end

 end

 def white

   if user_signed_in? and current_user.pcards
     @users_cards = current_user.pcards.pluck(:card_id)
   end

   @mechanics = Mechanic.all
   @title="White Standard Magic the Gathering Cards"
   @search = Card.ransack(params[:q])
   @cards = @search.result(distinct: true)
   @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   @subtypes = Subtype.all
   render template: "cards/index"
 end

 def blue

   if user_signed_in? and current_user.pcards
     @users_cards = current_user.pcards.pluck(:card_id)
   end

   @mechanics = Mechanic.all
   @title="Blue Standard Magic the Gathering Cards"
   @search = Card.ransack(params[:q])
   @cards = @search.result(distinct: true)
   @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   @subtypes = Subtype.all
   render template: "cards/index"
 end

 def black
   if user_signed_in? and current_user.pcards
     @users_cards = current_user.pcards.pluck(:card_id)
   end

   @mechanics = Mechanic.all
   @title="Black Standard Magic the Gathering Cards"
   @search = Card.ransack(params[:q])
   @cards = @search.result(distinct: true)
   @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   @subtypes = Subtype.all
   render template: "cards/index"
 end

 def red
   if user_signed_in? and current_user.pcards
     @users_cards = current_user.pcards.pluck(:card_id)
   end

   @mechanics = Mechanic.all
   @title="Red Standard Magic the Gathering Cards"
   @search = Card.ransack(params[:q])
   @cards = @search.result(distinct: true)
   @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   @subtypes = Subtype.all
   render template: "cards/index"
 end

 def green
   if user_signed_in? and current_user.pcards
     @users_cards = current_user.pcards.pluck(:card_id)
   end

   @mechanics = Mechanic.all
   @title="Green Standard Magic the Gathering Cards"
   @search = Card.ransack(params[:q])
   @cards = @search.result(distinct: true)
   @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   @subtypes = Subtype.all
   render template: "cards/index"
 end

 def artifact
   if user_signed_in? and current_user.pcards
     @users_cards = current_user.pcards.pluck(:card_id)
   end

   @mechanics = Mechanic.all
   @title="Artifact Standard Magic the Gathering Cards"
   @search = Card.ransack(params[:q])
   @cards = @search.result(distinct: true)
   @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   @subtypes = Subtype.all
   render template: "cards/index"
 end

 def show

   @card = Card.friendly.find(params[:id])
   @latest_price = @card.tcg_prices.last

   @card_prices = @card.tcg_prices.last(5)

   @title="#{@card.name} is in Standard | Standard MTG Cards"

  unless @card.text.nil?
    if @card.text =~ /(?:\n\r?|\r\n?)/
      @card_text = @card.text.gsub(/(?:\n\r?|\r\n?)/, '<br /> <br />')
    else
      @card_text = @card.text
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
