module ApplicationHelper

  def doEbayRequest(keywords)
    finder = Rebay2::Finding.new
    response = finder.find_items_by_keywords(
      {
        :keywords => keywords,
        :itemFilter => [
          :name => "ListingType",
          :value => "FixedPrice",
          :value => "StoreInventory",
          :value => "AuctionWithBIN"
        ],
        :GetItFastOnly => true
      }
    )
    @response = response.response

    return @response
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  #returns the total amount of cards in the db that match this set
  #usage: looking for 'standards' object
  def getTotalCardsInSet(set)

    amount = Card.where(set: set.short_name.upcase).count

  end

  def import_these_cards_from_this_set(set)

    require File.expand_path('config/environment.rb')

    search_params = "s:" + set

    @set = Scryfall::Cards.search search_params

    #@set = MTG::Card.where(set: set).all

    set_data = @set['data']

    set_data.each do |card|

      hashCard = JSON.parse card.to_json

      if hashCard['card_faces']

        hashCard['image_uris'] = hashCard['card_faces']

      end

      if hashCard['multiverse_ids'].count > 1

        hashCard['multiverse_ids2'] = hashCard['multiverse_ids'][1]

      else

        hashCard['multiverse_ids2'] = 0;

      end


      Card.create!(
        :name => hashCard['name'],
        :layout => hashCard['layout'],
        :mana_cost => hashCard['mana_cost'],
        :cmc => hashCard['cmc'],
        :type_line => hashCard['type_line'],
        :rarity => hashCard['rarity'],
        :multiverseid => hashCard['multiverse_ids'][0],
        :multiverseid2 => hashCard['multiverse_ids2'],
        :images => hashCard['image_uris'].to_s,
        :colors => hashCard['colors'] || ['C'],
        :legalities => hashCard['legalities'].to_a,
        :rulings => hashCard['rulings'],
        :artist => hashCard['artist'],
        :mtgo_id => hashCard['mtgo_id'],
        :arena_id => hashCard['arena_id'],
        :tcgplayer_id => hashCard['tcgplayer_id'],
        :lang => hashCard['lang'],
        :released_at_date => hashCard['released_at'],
        :uri => hashCard['uri'],
        :scryfall_uri => hashCard['scryfall_uri'],
        :oracle_text => hashCard['oracle_text'],
        :color_identity => hashCard['color_identity'],
        :games => hashCard['games'],
        :reserved => hashCard['reserved'],
        :foil => hashCard['foil'],
        :nonfoil => hashCard['nonfoil'],
        :oversized => hashCard['oversized'],
        :promo => hashCard['promo'],
        :reprint => hashCard['reprint'],
        :variation => hashCard['variation'],
        :set => hashCard['set'].upcase,
        :set_name => hashCard['set_name'],
        :set_type => hashCard['set_type'],
        :set_uri => hashCard['set_uri'],
        :set_search_uri => hashCard['set_search_uri'],
        :scryfall_set_uri => hashCard['scryfall_set_uri'],
        :rulings_uri => hashCard['rulings_uri'],
        :prints_search_uri => hashCard['prints_search_uri'],
        :collection_number => hashCard['collector_number'],
        :digital => hashCard['digital'],
        :rarity => hashCard['rarity'],
        :flavor_text => hashCard['flavor_text'],
        :border_color => hashCard['border_color'],
        :frame => hashCard['frame'],
        :full_art => hashCard['full_art'],
        :textless => hashCard['textless'],
        :booster => hashCard['booster'],
        :edhrec_rank => hashCard['edhrec_rank'],
        :prices => hashCard['prices'].to_s,
        :story_spotlight => hashCard['story_spotlight'],
        :avgprice => hashCard['prices']
      )

    end

  end

end
