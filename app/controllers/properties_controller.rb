class PropertiesController < ApplicationController
  def index
    @card = MTG::Card.find(386616)
  end
end
