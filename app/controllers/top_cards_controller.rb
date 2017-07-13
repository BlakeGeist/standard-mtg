class TopCardsController < ApplicationController

  def index
    @top_cards = Top_cards.all
  end

  def new
    @top_cards = Top_cards.new
  end

  def edit
    @top_cards = Top_cards.find(params[:id])
  end

  def create
    @top_cards = Top_cards.new(top_cards_params)

    if @top_cards.save
      redirect_to @top_cards
    else
      render 'new'
    end
  end

  def update
    @top_cards = Top_cards.find(params[:id])

    if @top_cards.update(top_cards_params)
      redirect_to @top_cards
    else
      render 'edit'
    end
  end

  def destroy
    @top_cards = Top_cards.find(params[:id])
    @top_cards.destroy

    redirect_to top_cards_path
  end

  private
    def tcg_price_params
      params.require(:tcg_price).permit(:name, :events)
    end

end
