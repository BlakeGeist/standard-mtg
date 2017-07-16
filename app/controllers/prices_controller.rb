class PricesController < ApplicationController
  def create
    @card = Card.friendly.find(params[:card_id])
    @tcg_price = @card.tcg_prices.create(tcg_price_params)
    redirect_to card_path(@card)
  end

  def destroy
    @card = Card.friendly.find(params[:card_id])
    @tcg_price = @card.prices.find(params[:id])
    @tcg_price.destroy
    redirect_to card_path(@card)
  end

  private
    def price_params
      params.require(:price).permit(:hiprice, :lowprice, :avgprice, :foilavgprice, :link, :market)
    end
end
