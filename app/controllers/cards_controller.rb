class CardsController < ApplicationController

def index

  @title ="Standard Magic the Gathering Cards"

  @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where.not("types like?", "%Land%").sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)

  respond_to do |format|
    format.js
    format.html
  end

 end

 def white
   @title="White Standard Magic the Gathering Cards"
   @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("mana_cost like ?", "%W%").where.not("types like?", "%Land%").sort_by{ |t| t.cmc.to_i }.paginate(:page => params[:page], :per_page => 28)
   render template: "cards/index"
 end

 def blue
   @title="Blue Standard Magic the Gathering Cards"
   @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("mana_cost like ?", "%U%").where.not("types like?", "%Land%").sort_by{ |t| t.cmc.to_i }.paginate(:page => params[:page], :per_page => 28)
   render template: "cards/index"
 end

 def black
   @title="Black Standard Magic the Gathering Cards"
   @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("colors like ?", "%B%").where.not("types like?", "%Land%").sort_by{ |t| t.cmc.to_i }.paginate(:page => params[:page], :per_page => 28)
   render template: "cards/index"
 end

 def red
   @title="Red Standard Magic the Gathering Cards"
   @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("colors like ?", "%R%").where.not("types like?", "%Land%").sort_by{ |t| t.cmc.to_i }.paginate(:page => params[:page], :per_page => 28)
   render template: "cards/index"
 end

 def green
   @title="Green Standard Magic the Gathering Cards"
   @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("colors like ?", "%G%").where.not("types like?", "%Land%").sort_by{ |t| t.cmc.to_i }.paginate(:page => params[:page], :per_page => 28)
   render template: "cards/index"
 end

 def artifact
   @title="Artifact Standard Magic the Gathering Cards"
   @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("types like ?", "%Artifact%").where.not("types like?", "%Land%").sort_by{ |t| t.cmc.to_i }.paginate(:page => params[:page], :per_page => 28)
   render template: "cards/index"
 end

 def show

   @card = Card.friendly.find(params[:id])

   @title="#{@card.name} is in Standard"

   @standard = [
     'Shadows over Innistrad',
     'Welcome Deck 2016',
     'Oath of the Gatewatch',
     'Battle for Zendikar',
     'Magic Origins',
     'Dragons of Tarkir'
   ]

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

   redirect_to cards_path
 end

 private
   def card_params
     params.require(:card).permit(:info)
   end
end
