class RedController < ApplicationController
  def index
    @cards = MTG::Card.where(set: 'ktk').all
  end
end
