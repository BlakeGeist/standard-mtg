class DashboardsController < ApplicationController

  def index
    
    @cards = current_user.pcards.all.sort_by{ |t| [t.card_id.to_i] }

    @user = current_user

    if current_user.admin?

      @cards = Card.all.sort_by{ |t| [t.name] }

      render action: "admin_index"

    end
  end

end
