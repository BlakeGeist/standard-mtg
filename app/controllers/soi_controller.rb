class SoiController < ApplicationController
  def index
    @title="Shadows over Innistrad Card List"
    @soi_cards = Card.where(set: 'SOI').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    @sets = MTG::Set.all

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
      {"set":"Dragon's Maze"},
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

  end

  def red
    @title="Red Shadows over Innistrad Card List"
    @soi_cards = Card.where(set: 'SOI').where("colors like ?", "%Red%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

  def blue
    @title="Blue Shadows over Innistrad Card List"
    @soi_cards = Card.where(set: 'SOI').where("colors like ?", "%Blue%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

  def black
    @title="Black Shadows over Innistrad Card List"
    @soi_cards = Card.where(set: 'SOI').where("colors like ?", "%Black%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

  def green
    @title="Green Shadows over Innistrad Card List"
    @soi_cards = Card.where(set: 'SOI').where("colors like ?", "%Green%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

  def white
    @title="White Shadows over Innistrad Card List"
    @soi_cards = Card.where(set: 'SOI').where("colors like ?", "%White%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

  def artifact
    @title="Artifact Shadows over Innistrad Card List"
    @soi_cards = Card.where(set: 'SOI').where("types like ?", "%Artifact%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

  #set meachanics
  def dfc
    @title="Double Faced Shadows over Innistrad Card List"
    @soi_cards = Card.where(set: 'SOI').where("layout like ?", '%double-faced%').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

end
