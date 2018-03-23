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

  def import_these_cards(set)

    require File.expand_path('config/environment.rb')

    @set = MTG::Card.where(set: set).all

    @set.each do |card|

      hashCard = JSON.parse card.to_json

      puts hashCard['legalities']

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
