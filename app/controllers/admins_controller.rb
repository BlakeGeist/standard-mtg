class AdminsController < ApplicationController

  def index

    @color = Color.new

    @colors = Color.all

  end

end
