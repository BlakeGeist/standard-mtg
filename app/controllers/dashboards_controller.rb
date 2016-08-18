class DashboardsController < ApplicationController
  def index
    @user = current_user
  end

  def show

    @cards = current_user.pcards.all.sort_by{ |t| [t.card_id] }

    @user = current_user

    if current_user.admin?

      @cards = Card.all.sort_by{ |t| [t.name] }
      render action: "admin_show"
    end

  end
end
