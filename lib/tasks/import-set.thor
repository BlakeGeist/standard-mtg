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
        :manaCost => hashCard['manaCost'],
        :cmc => hashCard['cmc'],
        :cardType => hashCard['type'],
        :rarity => 'rarity',
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
        :manaCost => hashCard['manaCost'],
        :cmc => hashCard['cmc'],
        :cardType => hashCard['type'],
        :rarity => 'rarity',
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
        :manaCost => hashCard['manaCost'],
        :cmc => hashCard['cmc'],
        :cardType => hashCard['type'],
        :rarity => 'rarity',
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
        :manaCost => hashCard['manaCost'],
        :cmc => hashCard['cmc'],
        :cardType => hashCard['type'],
        :rarity => 'rarity',
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
        :manaCost => hashCard['manaCost'],
        :cmc => hashCard['cmc'],
        :cardType => hashCard['type'],
        :rarity => 'rarity',
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
        :manaCost => hashCard['manaCost'],
        :cmc => hashCard['cmc'],
        :cardType => hashCard['type'],
        :rarity => 'rarity',
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
