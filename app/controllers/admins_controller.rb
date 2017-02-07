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
    $standard_codes = @standards.map { |set| set.short_name.downcase}

    mtg_sets = MTG::Set.all

    $recent_mtg_sets = mtg_sets.last(20).reverse


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

    respond_to do |format|
      format.js
      format.html
    end

  end


  #this is the method called by the import set button from the admin
  def import_set

    @this_set = Standard.find_by_short_name(params[:set_code])

    import_these_cards(params[:set_code])

    respond_to do |format|
      format.js
    end

  end

  def getTokenStatus

    require 'ebayr'

    @GetOrders = Ebayr.call(:GeteBayTime)

    respond_to do |format|
      format.js
    end

  end

  #this is the method called by the delete set button from the admins
  def delete_set_cand

    @this_set = Standard.find_by_short_name(params[:set_code])

    @this_set.destroy
    Card.where(set: params[:set_code_upper]).destroy_all

    respond_to do |format|
      format.js
    end

  end

end
