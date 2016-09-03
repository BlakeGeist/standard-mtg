class TcgPricesController < ApplicationController
  def create
    @card = Card.friendly.find(params[:card_id])
    @tcg_price = @card.tcg_prices.create(tcg_price_params)
    redirect_to card_path(@card)
  end

  def destroy
    @card = Card.friendly.find(params[:card_id])
    @tcg_price = @card.tcg_prices.find(params[:id])
    @tcg_price.destroy
    redirect_to card_path(@card)
  end

  private
    def tcg_price_params
      params.require(:tcg_price).permit(:hiprice, :lowprice, :avgprice, :foilavgprice, :link)
    end
end
