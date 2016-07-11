class Import < Thor

  desc "standard","import standard cards into the db"

  def standard

    require File.expand_path('config/environment.rb')

    puts 'importing standard'

    @standard = [
      {"set":"Shadows over Innistrad"},
      {"set":"Welcome Deck 2016"},
      {"set":"Oath of the Gatewatch"},
      {"set":"Battle for Zendikar"},
      {"set":"Magic Origins"},
      {"set":"Dragons of Tarkir"}
    ]

    @standard.each do |mod|

      puts mod[:set]

      cards = MTG::Card.where(setName: mod[:set]).all

      cards.each do |card|

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

  desc "subtypes", "subtypes"

  def subtypes

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

  desc "mechanics", "import mechanics"

  def mechanics

    require File.expand_path('config/environment.rb')

    @mechanics = [
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

    @mechanics.each do |mechanic|

      puts mechanic[:mechanic]

      Mechanic.create!(
      :name => mechanic[:mechanic]
      )

    end

  end

  desc "modern", "import modern"

  def modern

    require File.expand_path('config/environment.rb')

    puts 'importing modern'

    @modern = [
      {"set":"Shadows over Innistrad"},
      {"set":"Welcome Deck 2016"},
      {"set":"Oath of the Gatewatch"},
      {"set":"Battle for Zendikar"},
      {"set":"Magic Origins"},
      {"set":"Dragons of Tarkir"},
      {"set":"Fate Reforged" },
      {"set":"Khans of Tarkir"},
      {"set":"Magic 2015"},
      {"set":"Journey into Nyx"},
      {"set":"Born of the Gods"},
      {"set":"Theros"},
      {"set":"Magic 2014"},
      {"set":"Dragon''s Maze"},
      {"set":"Gatecrash"},
      {"set":"Return to Ravnica"},
      {"set":"Magic 2013"},
      {"set":"Avacyn Restored"},
      {"set":"Dark Ascension"},
      {"set":"Innistrad"},
      {"set":"Magic 2012"},
      {"set":"New Phyrexia"},
      {"set":"Mirrodin Besieged"},
      {"set":"Scars of Mirrodin"},
      {"set":"Magic 2011"},
      {"set":"Rise of the Eldrazi"},
      {"set":"Worldwake"},
      {"set":"Zendikar"},
      {"set":"Magic 2010"},
      {"set":"Conflux"},
      {"set":"Alara Reborn"},
      {"set":"Shards of Alara"},
      {"set":"Eventide"},
      {"set":"Shadowmoor"},
      {"set":"Morningtide"},
      {"set":"Lorwyn"},
      {"set":"Tenth Edition"},
      {"set":"Future Sight"},
      {"set":"Planar Chaos"},
      {"set":"Time Spiral"},
      {"set":"Coldsnap"},
      {"set":"Dissension"},
      {"set":"Guildpact"},
      {"set":"Ravnica: City of Guilds"},
      {"set":"Ninth Edition"},
      {"set":"Saviors of Kamigawa"},
      {"set":"Eighth Edition"},
      {"set":"Betrayers of Kamigawa"},
      {"set":"Champions of Kamigawa"},
      {"set":"Fifth Dawn"},
      {"set":"Darksteel"},
      {"set":"Mirrodin"}
    ]

     @modern.each do |mod|

       cards = MTG::Card.where(setName: mod[:set]).all

       cards.each do |card|

         hashCard = JSON.parse card.to_json

         puts hashCard['name']


         Card.where(multiverseid: hashCard['multiverseid']).first_or_create do |card|

           card.info = hashCard
           card.name = hashCard['name']
           card.layout = hashCard['layout']
           card.mana_cost = hashCard['manaCost']
           card.cmc = hashCard['cmc']
           card.cardType = hashCard['type']
           card.rarity = hashCard['rarity']
           card.flavor = hashCard['flavor']
           card.text = hashCard['text']
           card.number = hashCard['number']
           card.power = hashCard['power']
           card.toughness = hashCard['toughness']
           card.multiverseid = hashCard['multiverseid']
           card.originalText = hashCard['originalText']
           card.originalType = hashCard['originalType']
           card.set = hashCard['set']
           card.setName = hashCard['setName']
           card.image_url = hashCard['imageUrl']
           card.supertypes = hashCard['supertypes']
           card.subtypes = hashCard['subtypes']
           card.types = hashCard['types']
           card.colors = hashCard['colors']
           card.printings = hashCard['printings']
           card.legalities = hashCard['legalities']
           card.rulings = hashCard['rulings']
           card.foreignNames = hashCard['foreignNames']
           card.artist = hashCard['artist']

         end

       end

     end

  end

end
