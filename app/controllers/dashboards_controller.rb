class DashboardsController < ApplicationController

  def index

    @users_cards = current_user.pcards.pluck(:card_id, :amount)

    @this_cards = Card.where(multiverseid: @users_cards);

    @collection_total = @this_cards.pluck(:lowprice).compact

    @this_search = @this_cards.ransack(params[:q])

    @the_cards = @this_search.result(distinct: true)

    @cards = @the_cards.sort_by{ |t| [t.colors.count, t.colors, t.name] }.paginate(:page => params[:page], :per_page => 28)

    @subtypes = Subtype.all

    if current_user.admin?

      @cards = Card.all.sort_by{ |t| [t.name] }

      render action: "admin_index"

    end
  end

end
