class StandardsController < ApplicationController
  def create
    @standard = Standard.create(standard_params)
    redirect_to admins_index_path
  end

  def destroy
    @standard = Standard.find(params[:id])
    @standard.destroy
    redirect_to admins_index_path
  end

  def show

    @standard = Standard.friendly.find(params[:id])

    @search = Card.where('set=?', @standard.short_name.upcase).where.not("types like?", "%Land%").search(params[:q])

    @the_cards = @search.result(distinct: true)

    @cards = @the_cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)

  end

  private
    def standard_params
      params.require(:standard).permit(:name, :short_name, :photo)
    end

end
