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

end
