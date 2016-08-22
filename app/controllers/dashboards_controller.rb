class DashboardsController < ApplicationController

  def index

    @users_cards = current_user.pcards.pluck(:card_id)

    @cards = Card.where(multiverseid: @users_cards);

    @search = @cards.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'EMN', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where.not("types like?", "%Land%").search(params[:q])

    @the_cards = @search.result(distinct: true)

    @cards = @the_cards.sort_by{ |t| [t.colors.count, t.colors, t.name] }.paginate(:page => params[:page], :per_page => 28)

    if current_user.admin?

      @cards = Card.all.sort_by{ |t| [t.name] }

      render action: "admin_index"

    end
  end

end
