class Import < Thor

  desc "set","import a mtg set into the db"

  def set

    require File.expand_path('config/environment.rb')

    @set = MTG::Card.where(set: 'soi').all

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

  desc "set2","import a mtg set into the db"

  def set2

    require File.expand_path('config/environment.rb')

    @set = MTG::Card.where(set: 'w16').all

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

  desc "set3","import a mtg set into the db"

  def set3

    require File.expand_path('config/environment.rb')

    @set = MTG::Card.where(set: 'ogw').all

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

  desc "set4","import a mtg set into the db"

  def set4

    require File.expand_path('config/environment.rb')

    @set = MTG::Card.where(set: 'bfz').all

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

  desc "set5","import a mtg set into the db"

  def set5

    require File.expand_path('config/environment.rb')

    @set = MTG::Card.where(set: 'ori').all

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

  desc "set6","import a mtg set into the db"

  def set6

    require File.expand_path('config/environment.rb')

    @set = MTG::Card.where(set: 'dtk').all

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
