class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #this allows the cards to be sortable
  require 'will_paginate/array'

  def ebayRequest()
    doEbayRequest(params[:keywords])
    respond_to do |format|
      format.js
    end
  end

  $colors = Color.all
  $mechanics = Mechanic.all
  $subtypes = Subtype.all
  $rarities = Crarity.all
  $standard = Standard.where(:active => '1').order("created_at ASC")

  $models = [[$colors, "Colors", "colors"], [$standard, "Set", "set"],  [$rarities, "Rarities", "rarity"], [$mechanics, "Mechanics", "mechanics"], [$subtypes, "Subtypes", "subtypes"]]

  # Dragons of Tarkir | dtk
  # Magic Origins | ori
  # Battle for Zendikar | bfz
  # Oath of the Gatewatch | ogw
  # Welcome Deck 2016 | W16
  # Shadows over Innistrad | soi


  def open_modal

    @modal = params[:modal]
    @multiverseid = params[:multiverseid]
    @card = Card.find_by! multiverseid: @multiverseid
    @pcard = current_user.pcards.find_by! card_id: @multiverseid
    @text = @card.text

    if @text.to_s.include? '&minus;'

      @text = @text.gsub!('&minus;','-')

    end

    if @text.to_s.include? '&rsquo;'

      @text = @text.gsub!('&rsquo;',"'")

    end

    respond_to do |format|
      format.js
    end

  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :provider, :uid])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :provider, :uid])
    end

end
