class Import < Thor

  desc 'list_sets', 'list out the set names'

  def list_sets

    require File.expand_path('config/environment.rb')

    @set = MTG::Set.all

    @set.each do |card|

      puts card.name

    end

  end

  desc "set","import a mtg set into the db"

  def set

    require File.expand_path('config/environment.rb')

    @set = MTG::Card.where(set: 'enm').all

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

  desc 'emn', "import the eldritch moon set into the db"

  def emn

    require File.expand_path('config/environment.rb')

    @set = MTG::Card.where(set: 'emn').all

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

  desc "subtype", "subtypes"

  def subtype

    require File.expand_path('config/environment.rb')

    @subtypes = [
      {"subtype":"Ally"},
      {"subtype":"Angel"},
      {"subtype":"Archer"},
      {"subtype":"Arlinn"},
      {"subtype":"Artificer"},
      {"subtype":"Assassin"},
      {"subtype":"Aura"},
      {"subtype":"Avatar"},
      {"subtype":"Bat"},
      {"subtype":"Beast"},
      {"subtype":"Bear"},
      {"subtype":"Berserker"},
      {"subtype":"Bird"},
      {"subtype":"Boar"},
      {"subtype":"Cat"},
      {"subtype":"Centaur"},
      {"subtype":"Chandra"},
      {"subtype":"Cleric"},
      {"subtype":"Construct"},
      {"subtype":"Crab"},
      {"subtype":"Curse"},
      {"subtype":"Demon"},
      {"subtype":"Devil"},
      {"subtype":"Djinn"},
      {"subtype":"Dragon"},
      {"subtype":"Drake"},
      {"subtype":"Dryad"},
      {"subtype":"Drone"},
      {"subtype":"Druid"},
      {"subtype":"Efreet"},
      {"subtype":"Elemental"},
      {"subtype":"Elf"},
      {"subtype":"Equipment"},
      {"subtype":"Eldrazi"},
      {"subtype":"Elk"},
      {"subtype":"Faerie"},
      {"subtype":"Fish"},
      {"subtype":"Frog"},
      {"subtype":"Fox"},
      {"subtype":"Fungus"},
      {"subtype":"Gargoyle"},
      {"subtype":"Giant"},
      {"subtype":"Gideon"},
      {"subtype":"Goblin"},
      {"subtype":"Golem"},
      {"subtype":"Griffin"},
      {"subtype":"Hellion"},
      {"subtype":"Horror"},
      {"subtype":"Hound"},
      {"subtype":"Human"},
      {"subtype":"Homunculus"},
      {"subtype":"Horse"},
      {"subtype":"Hydra"},
      {"subtype":"Illusion"},
      {"subtype":"Imp"},
      {"subtype":"Insect"},
      {"subtype":"Jace"},
      {"subtype":"Juggernaut"},
      {"subtype":"Kirin"},
      {"subtype":"Kiora"},
      {"subtype":"Knight"},
      {"subtype":"Kor"},
      {"subtype":"Kraken"},
      {"subtype":"Liliana"},
      {"subtype":"Lizard"},
      {"subtype":"Merfolk"},
      {"subtype":"Minotaur"},
      {"subtype":"Mole"},
      {"subtype":"Monk"},
      {"subtype":"Naga"},
      {"subtype":"Nahiri"},
      {"subtype":"Narset"},
      {"subtype":"Nightmare"},
      {"subtype":"Nissa"},
      {"subtype":"Nixilis"},
      {"subtype":"Ogre"},
      {"subtype":"Ooze"},
      {"subtype":"Orc"},
      {"subtype":"Ox"},
      {"subtype":"Pegasus"},
      {"subtype":"Phoenix"},
      {"subtype":"Plant"},
      {"subtype":"Processor"},
      {"subtype":"Rat"},
      {"subtype":"Rhino"},
      {"subtype":"Rogue"},
      {"subtype":"Salamander"},
      {"subtype":"Sarkhan"},
      {"subtype":"Scarecrow"},
      {"subtype":"Scout"},
      {"subtype":"Serpent"},
      {"subtype":"Skeleton"},
      {"subtype":"Shaman"},
      {"subtype":"Shapeshifter"},
      {"subtype":"Sorin"},
      {"subtype":"Sphinx"},
      {"subtype":"Slug"},
      {"subtype":"Snake"},
      {"subtype":"Soldier"},
      {"subtype":"Spider"},
      {"subtype":"Spirit"},
      {"subtype":"Starfish"},
      {"subtype":"Thopter"},
      {"subtype":"Troll"},
      {"subtype":"Treefolk"},
      {"subtype":"Turtle"},
      {"subtype":"Unicorn"},
      {"subtype":"Vampire"},
      {"subtype":"Vedalken"},
      {"subtype":"Wall"},
      {"subtype":"Warrior"},
      {"subtype":"Werewolf"},
      {"subtype":"Wizard"},
      {"subtype":"Wolf"},
      {"subtype":"Wurm"},
      {"subtype":"Yeti"},
      {"subtype":"Zombie"}
    ]

    @subtypes.each do |subtype|

      puts subtype[:subtype]

      Subtype.create!(
      :name => subtype[:subtype]
      )

    end



  end


end
