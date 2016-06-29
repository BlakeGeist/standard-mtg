class CardsController < ApplicationController

def index

  @mechanics = Mechanic.all

  @title ="Standard Magic the Gathering Cards"

  @search = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where.not("types like?", "%Land%").search(params[:q])

  @cards = @search.result(distinct: true)

  @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)

  @subtypes = Subtype.all

  respond_to do |format|
    format.js
    format.html
  end

 end

 def white
   @mechanics = Mechanic.all
   @title="White Standard Magic the Gathering Cards"
   @search = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("mana_cost like ?", "%W%").where.not("types like?", "%Land%").search(params[:q])
   @cards = @search.result(distinct: true)
   @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   @subtypes = Subtype.all
   render template: "cards/index"
 end

 def blue
   @mechanics = Mechanic.all
   @title="Blue Standard Magic the Gathering Cards"
   @search = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("mana_cost like ?", "%U%").where.not("types like?", "%Land%").search(params[:q])
   @cards = @search.result(distinct: true)
   @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   @subtypes = Subtype.all
   render template: "cards/index"
 end

 def black
   @mechanics = Mechanic.all
   @title="Black Standard Magic the Gathering Cards"
   @search = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("mana_cost like ?", "%B%").where.not("types like?", "%Land%").search(params[:q])
   @cards = @search.result(distinct: true)
   @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   @subtypes = Subtype.all
   render template: "cards/index"
 end

 def red
   @mechanics = Mechanic.all
   @title="Red Standard Magic the Gathering Cards"
   @search = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("mana_cost like ?", "%R%").where.not("types like?", "%Land%").search(params[:q])
   @cards = @search.result(distinct: true)
   @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   @subtypes = Subtype.all
   render template: "cards/index"
 end

 def green
   @mechanics = Mechanic.all
   @title="Green Standard Magic the Gathering Cards"
   @search = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("mana_cost like ?", "%G%").where.not("types like?", "%Land%").search(params[:q])
   @cards = @search.result(distinct: true)
   @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   @subtypes = Subtype.all
   render template: "cards/index"
 end

 def artifact
   @mechanics = Mechanic.all
   @title="Artifact Standard Magic the Gathering Cards"
   @search = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("types like ?", "%Artifact%").where.not("types like?", "%Land%").search(params[:q])
   @cards = @search.result(distinct: true)
   @cards = @cards.sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   @subtypes = Subtype.all
   render template: "cards/index"
 end

 #set meachanics
 def dfc
   @title="Double Faced Standard Card List | MTG"
   @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("layout like ?", '%double-faced%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   render template: "cards/index"
 end

 def delirium
   @title="Delirium Standard Card List | MTG"
   @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ?", '%Delirium%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
   render template: "cards/index"
 end

  def investigate
    @title="Investigate Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ? OR text like ?", '%Investigate%', '%investigate%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

  def madness
    @title="Madness Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ? OR text like ?", '%Madness%', '%madness%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

  def skulk
    @title="Skulk Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ? OR text like ?", '%Skulk%', '%skulk%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

  def cohort
    @title="Cohort Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ? OR text like ?", '%Cohort%', '%cohort%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

  def support
    @title="Support Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ? OR text like ?", '%Support%', '%support%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

  def surge
    @title="Surge Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ?", '%Surge%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

  def awaken
    @title="Awaken Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ?", '%Awaken%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

  def rally
    @title="Rally Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ?", '%Rally%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

  def converge
    @title="Converge Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ?", '%Converge%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

  def landfall
    @title="Landfall Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ?", '%Landfall%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

  def renown
    @title="Renown Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ?", '%Renown%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

  def spell_mastery
    @title="Spell Mastery Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ?", '%Spell mastery%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

  def menace
    @title="Menace Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ?", '%Menace%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end

 def show

   @card = Card.friendly.find(params[:id])

   @title="#{@card.name} is in Standard"

   @standard = [
     'Shadows over Innistrad',
     'Welcome Deck 2016',
     'Oath of the Gatewatch',
     'Battle for Zendikar',
     'Magic Origins',
     'Dragons of Tarkir'
   ]

  unless @card.text.nil?
    if @card.text =~ /(?:\n\r?|\r\n?)/
      @card_text = @card.text.gsub(/(?:\n\r?|\r\n?)/, '<br /> <br />')
    else
      @card_text = @card.text
    end
    if @card_text.include? ("(")
      @card_text = @card_text.gsub('(', '<em>(')
      @card_text = @card_text.gsub(')', ')</em>')
    end
  end

 end

 def new
   @card = Card.new
 end

 def edit
   @card = Card.find(params[:id])
 end

 def create
   @card = Card.new(card_params)

   if @card.save
     redirect_to @card
   else
     render 'new'
   end
 end

 def update
   @card = Card.find(params[:id])

   if @card.update(card_params)
     redirect_to @card
   else
     render 'edit'
   end
 end

 def destroy
   @card = Card.find(params[:id])
   @card.destroy

   redirect_to cards_path
 end

 private
   def card_params
     params.require(:card).permit(:info)
   end
end
