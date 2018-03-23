class StandardsController < ApplicationController
  def create
    @standard = Standard.create(standard_params)
    @standards = Standard.all
    $standard_codes = @standards.map { |set| set.short_name}

    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit
    @standard = Standard.friendly.find(params[:id])
  end

  def update
    @standard = Standard.friendly.find(params[:id])

    if @standard.update(standard_params)
      redirect_to edit_standard_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @standard = Standard.find(params[:id])
    @standard.destroy
    respond_to do |format|
      format.js
    end
  end

  def show
    if user_signed_in? and current_user.pcards
      @users_cards = current_user.pcards.pluck(:card_id)
    end

    @standard = Standard.friendly.find(params[:id])
    @title = "#{@standard.name} Card List | Standard MTG Cards"
    @search = Card.where('set=?', @standard.short_name).where.not("types like?", "%Land%").search(params[:q])
    @t_cards = Card.where('set=?', @standard.short_name)
    @last_ten = Card.where('set=?', @standard.short_name).sort_by{ |t| [t.lowprice.to_i] }.reverse
    @the_cards = @search.result(distinct: true)
    @cards = @the_cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 24)
  end

  private
    def standard_params
      params.require(:standard).permit(:name, :short_name, :photo, :slug, :active)
    end

end
