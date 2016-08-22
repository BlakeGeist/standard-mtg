class DashboardsController < ApplicationController

  def index

    @users_cards = current_user.pcards.pluck(:card_id)

    @cards = Card.where(multiverseid: @users_cards);

    if current_user.admin?

      @cards = Card.all.sort_by{ |t| [t.name] }

      render action: "admin_index"

    end
  end

end
