class TopCardsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @top_cards = TopCard.all
    $standard = Standard.all

    @cards = Card.where("price > ?", 0.01).where(set: $standard.map(&:short_name)).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 100)
  end

  def new
    @top_cards = TopCard.new
  end

  def edit
    @top_cards = TopCard.find(params[:id])
  end

  def create
    @top_cards = TopCard.new(top_cards_params)

    if @top_cards.save
      redirect_to @top_cards
    else
      render 'new'
    end
  end

  def update
    @top_cards = TopCard.find(params[:id])

    if @top_cards.update(top_cards_params)
      redirect_to @top_cards
    else
      render 'edit'
    end
  end

  def destroy
    @top_cards = TopCard.find(params[:id])
    @top_cards.destroy

    redirect_to top_cards_path
  end

  private

    def sort_column
      Card.where(set: $standard.map(&:short_name)).column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def top_card_params
      params.require(:top_card).permit(:name, :events)
    end

end
