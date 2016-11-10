module ApplicationHelper

  #returns the total amount of cards in the db that match this set
  #usage: looking for 'standards' object
  def getTotalCardsInSet(set)

    amount = Card.where(set: set.short_name.upcase).count

  end

  def showAuthTokens()

    hash = request.env["omniauth.auth"]

    flash[:notice] = hash
    
  end

  def getEbayTime()

    require 'ebayr'

    Ebayr.dev_id = "a036b866-4e0d-49de-b7f6-a45309064be2"

    Ebayr.auth_token = 'AgAAAA**AQAAAA**aAAAAA**igIcWA**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6AAmIKjC5aKpwudj6x9nY+seQ**CW0DAA**AAMAAA**YNWRWYDfWMS3T+xlkMYxMKU4WYRZ/Y90tx3rTXY9fvZuF5YUAcG3/QNgVukCBaF60xLK7YJn3H+3NEUzdeGTiyvMTPEZEMTCqFQ2eu3BPOaGHVReU2t4KtzR7MkDX8EM6NkZMfILZaVzJ25ZqIdDz6DL4MZ6Abf41KhBGuuU8FMwWshWxW6GciFbZAbEimv0hOExHALXkk/K4zfPNlrK8qdAyEhc2Xl7uJCZihtFUa2XfwQTEXFfKMq6tq+ZNIrysmZUnCyuxnfWRbDJCzciljbdCy5lUPN9VHnhqgYdZVqI7XjlsN/q+66LRkkl1HJhNY1jJ23oZwKsTw0Ml93VjWw1CQIZZe5kBSJZ+Q3Ig5K6P3gkiRyzAijYUHDAuiOjA0HPvCpJIASIvaUe9RssqO9BzqKViZ+L8n8wmi6s976P7smCvyss/Z/droe2sER++8swe2keT+S7rnMgpoqBKI80jXK8AY9QwSOXnpPgG6iov8XmWP8QtFIx2hQW20Vabd3QHvSTz2Dl3OUn+GZU61M0nXuV4cR1o1/t7xZNqksHMpAMpuz5z+mFrj2hyuASJIrkZdLfj42mViS2RXC2ACaNjXr00oN4uxGbH0HBj9FO6/y50yaNQCvvHQ/2sTrs90TxPGUXFPfxONVox/Nc+SUD20N/bWzHxdXH+cxAHGx21bzWbx8VNdrCqMZ9ifBeE0pDkIlu5GalcpyIrT5orTSK7vaVDZxMYDCB+c1SxTs1bYMoBumDh1tUOP6wrFOb'

    Ebayr.app_id = "BlakeGei-standard-SBX-5e6e394ea-29d730e6"

    Ebayr.cert_id = "SBX-e6e394ea763e-b466-4f1c-9f4e-f991"

    Ebayr.ru_name = "Blake_Geist-BlakeGei-standa-oysusnr"

    # Set this to true for testing in the eBay Sandbox (but remember to use the
    # appropriate keys!). It's true by default.
    Ebayr.sandbox = false

  end

  def import_these_cards(set)

    require File.expand_path('config/environment.rb')

    @set = MTG::Card.where(set: set).all

    @set.each do |card|

      hashCard = JSON.parse card.to_json

      puts hashCard['name']

      Card.create!(
        :info => hashCard,
        :name => hashCard['name'],
        :layout => hashCard['layout'],
        :mana_cost => hashCard['manaCost'],
        :cmc => hashCard['cmc'],
        :cardType => hashCard['type'],
        :rarity => hashCard['rarity'],
        :flavor => hashCard['flavor'],
        :text => hashCard['text'],
        :number => hashCard['number'],
        :power => hashCard['power'],
        :toughness => hashCard['toughness'],
        :multiverseid => hashCard['multiverseid'],
        :originalText => hashCard['originalText'],
        :originalType => hashCard['originalType'],
        :set => hashCard['set'],
        :setName => hashCard['setName'],
        :image_url => hashCard['imageUrl'],
        :supertypes => hashCard['supertypes'],
        :subtypes => hashCard['subtypes'],
        :types => hashCard['types'],
        :colors => hashCard['colors'],
        :printings => hashCard['printings'],
        :legalities => hashCard['legalities'],
        :rulings => hashCard['rulings'],
        :foreignNames => hashCard['foreignNames'],
        :artist => hashCard['artist']
      )

    end


  end


end
