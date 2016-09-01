class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #this allows the cards to be sortable
  require 'will_paginate/array'

  #current stndard

  # Dragons of Tarkir | dtk
  # Magic Origins | ori
  # Battle for Zendikar | bfz
  # Oath of the Gatewatch | ogw
  # Welcome Deck 2016 | W16
  # Shadows over Innistrad | soi

  $colors = [
    {color:"White"},
    {color:"Blue"},
    {color:"Black"},
    {color:"Red"},
    {color:"Green"},
    {color:"Artifact"}
  ]

  $rarities = [
    {rarity:"Mythic Rare"},
    {rarity:"Rare"},
    {rarity:"Uncommon"},
    {rarity:"Common"}
  ]

  $mechanics = [
    {"mechanic":"Deathtouch"},
    {"mechanic":"Defender"},
    {"mechanic":"Double strike"},
    {"mechanic":"Enchant"},
    {"mechanic":"Equip"},
    {"mechanic":"First strike"},
    {"mechanic":"Flash"},
    {"mechanic":"Flying"},
    {"mechanic":"Haste"},
    {"mechanic":"Hexproof"},
    {"mechanic":"Indestructible"},
    {"mechanic":"Lifelink"},
    {"mechanic":"Menace"},
    {"mechanic":"Prowess"},
    {"mechanic":"Reach"},
    {"mechanic":"Scry"},
    {"mechanic":"Trample"},
    {"mechanic":"Vigilance"}
  ]

  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end

end
