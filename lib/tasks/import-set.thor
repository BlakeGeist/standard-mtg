class Import < Thor

  desc 'list_sets', 'list out the set names'

  def list_sets

    require File.expand_path('config/environment.rb')

    @set = MTG::Set.all

    @set.each do |card|

      puts card.name

    end

  end

  desc 'standard_sets', "import the eldritch moon set into the db"

  def standard_sets

    require File.expand_path('config/environment.rb')



    @sets = [
      {"kld":"set"},
      {"emn":"set"},
      {"soi":"set"},
      {"w16":"set"},
      {"ogw":"set"},
      {"bfz":"set"},
      {"ori":"set"},
      {"dtk":"set"}
    ]

    @sets.each do |set|

      @set = MTG::Card.where(set: set[:set]).all

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
          :image_url_normal => hashCard['imageUrl'],
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

  desc "mechanics", "mechanics"

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

  desc "rarities", "rarities"

  def rarities

    require File.expand_path('config/environment.rb')

    @rarities = [
      {rarity:"Mythic Rare"},
      {rarity:"Rare"},
      {rarity:"Uncommon"},
      {rarity:"Common"}
    ]

    @rarities.each do |rarity|

      puts rarity[:rarity]

      Crarity.create!(
        :name => rarity[:rarity]
      )

    end

  end

  desc "all_sets", "import all sets"

  def all_sets

    #get all the sets

    #loop the sets

    #create set

    #get the cards from the set

    mtg_sets = MTG::Set.all

    mtg_sets_by_release_date = mtg_sets.sort_by { |set| set.release_date}

    mtg_sets_by_release_date.each do |set|

      hashSet = set.to_hash

      hashSet[:short_name] = set.code

      hashSet = hashSet.slice!("type")

      Cardset.create(hashSet)

      page_number = 1
      next_page = true

      setObject = Cardset.find_by_short_name(set.code)

      require File.expand_path('config/environment.rb')

      until !next_page do

        @set = Scryfall::Cards.search "s:" + set.code, page_number

        page_number = page_number + 1

        next_page = @set['has_more']

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

          setObject.cards.create(
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

  end

end
