class DecksController < ApplicationController
  def index
   @decks = Deck.all
 end

 def show
   @deck = Deck.friendly.find(params[:id])
   @title = "What #{@deck.name} cards are in Standard?"

   @cards = Card.where(id: @deck.card_ids)


 end

 def new
   @deck = Deck.new
 end

 def edit
   @deck = Deck.find(params[:id])
 end

 def create
   @deck = Deck.new(deck_params)


   if @deck.save
     redirect_to @deck
   else
     render 'new'
   end
 end

 def update
   @deck = Deck.find(params[:id])

   if @deck.update(deck_params)
     redirect_to @deck
   else
     render 'edit'
   end
 end

 def destroy
   @deck = Deck.find(params[:id])
   @deck.destroy

   redirect_to decks_path
 end

 private
   def deck_params
     params.require(:deck).permit(:name, card_ids:[])
   end
end
