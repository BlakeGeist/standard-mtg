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

    #standards
    #add a new standards
    @standard = Standard.new
    #set all subtypes var
    @standards = Standard.all

    #rarities
    #add a new rarities
    @rarity = Crarity.new
    #set all rarities var
    @rarities = Crarity.all

    @dont = ['id', 'created_at', 'updated_at', 'slug']

    @sections = [
      {
        "name":"Standard",
        "section":@standards,
        "newSection":@standard
      },
      {
        "name":"Colors",
        "section":@colors,
        "newSection":@color

      },
      {
        "name":"Subtypes",
        "section":@subtypes,
        "newSection":@subtype
      },
      {
        "name":"Mechanics",
        "section":@mechanics,
        "newSection":@mechanic
      },
      {
        "name":"Rarities",
        "section":@rarities,
        "newSection":@rarity
      }
    ]


  end

end
