class DashboardsController < ApplicationController

  def index

    @the_users_cards = current_user.pcards.all.sort_by{ |t| [t.card_id.to_i] }

    @the_cards = Card.where(id: @the_users_cards);

    if current_user.admin?

      @cards = Card.all.sort_by{ |t| [t.name] }

      render action: "admin_index"

    end
  end

end
