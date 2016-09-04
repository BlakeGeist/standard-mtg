class DashboardsController < ApplicationController
 helper PcardsHelper
  def index
    @users_cards = current_user.pcards.pluck(:card_id, :amount)

    @this_cards = Card.where(multiverseid: @users_cards);

    @search = @this_cards.ransack(params[:q])

    @the_cards = @search.result(distinct: true)

    if current_user.pcards.count > 0
      @cards = @the_cards.sort_by{ |t| [t.avgprice.to_i] }.reverse.paginate(:page => params[:page], :per_page => 28)
    end

    @subtypes = Subtype.all

    if current_user.admin?

      @cards = Card.all.sort_by{ |t| [t.colors.count] }

      render action: "admin_index"

    end
  end

end
