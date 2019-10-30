class CardsetsController < ApplicationController

  def index

    $colors = Color.all
    $mechanics = Mechanic.all
    $subtypes = Subtype.all
    $rarities = Crarity.all
    #$standard = Standard.all

    if user_signed_in? and current_user.pcards
      @users_cards = current_user.pcards.pluck(:card_id)
    end

    @title ="Standard MTG Card List 2 | Standard MTG Cards"
    @search = Card.all.ransack(params[:q])
    @the_cards = @search.result(distinct: true).where.not("type_line like?", "%Basic Land%")
    @cards = @the_cards.sort_by{ |t| [t.colors.count, t.cmc.to_i, t.name.to_s] }.paginate(:page => params[:page], :per_page => 30)
    @cardsd = Card.last(5)
    @this_thing =  $standard.map(&:short_name)

    respond_to do |format|
      format.js
      format.html { render layout: 'home' }
    end

  end

  def create
    @standard = Cardset.create(cardset_params)
    @cardsets = Cardset.all
    $standard_codes = @cardsets.map { |set| set.short_name}

    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit
    @standard = Cardset.friendly.find(params[:id])
  end

  def update
    @standard = Cardset.friendly.find(params[:id])

    if @standard.update(cardset_params)
      redirect_to edit_cardset_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @standard = Cardset.find(params[:id])
    @standard.destroy
    respond_to do |format|
      format.js
    end
  end

  def show
    if user_signed_in? and current_user.pcards
      @users_cards = current_user.pcards.pluck(:card_id)
    end

    @standard = Cardset.friendly.find(params[:id])
    @title = "#{@standard.name} Card List | Standard MTG Cards"
    @search = Card.where('set=?', @standard.short_name).search(params[:q])
    @t_cards = Card.where('set=?', @standard.short_name)
    @the_cards = @search.result(distinct: true)
    @cards = @the_cards.sort_by{ |t| [t.collection_number] }.paginate(:page => params[:page], :per_page => 24)
    @last_ten = Card.where('set=?', @standard.short_name).sort_by{ |t| [t.avgprice.to_i] }.reverse

  end

  private
    def cardset_params
      params.require(:cardset).permit(:name, :short_name, :photo, :slug, :active)
    end

end
