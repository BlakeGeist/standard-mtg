class AdminsController < ApplicationController

  def index

    #colors
    #add a new color
    @color = Color.new
    #set all colors var
    @colors = Color.all

    #subtypes
    #add a new subtypes
    @subtype = Subtype.new
    #set all subtypes var
    @subtypes = Subtype.all

    #mechanics
    #add a new subtypes
    @mechanic = Mechanic.new
    #set all subtypes var
    @mechanics = Mechanic.all

  end

end
