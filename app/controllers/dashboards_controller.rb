class DashboardsController < ApplicationController

  def index

    @user_pcard_card_id = current_user.pcards.pluck(:card_id)

    @cards = Card.where(multiverseid: @user_pcard_card_id);

    if current_user.admin?

      @cards = Card.all.sort_by{ |t| [t.name] }

      render action: "admin_index"

    end
  end

end
