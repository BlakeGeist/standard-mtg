class EmnController < ApplicationController
  def index
    @title="Oath of the Gatewatch Card List"
    @emn_cards = Card.where(set: 'EMN').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end

  def red
    @title="Red Oath of the Gatewatch Card List"
    @emn_cards = Card.where(set: 'EMN').where("colors like ?", "%Red%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "emn/index"
  end

  def blue
    @title="Blue Oath of the Gatewatch Card List"
    @emn_cards = Card.where(set: 'EMN').where("colors like ?", "%Blue%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "emn/index"
  end

  def black
    @title="Black Oath of the Gatewatch Card List"
    @emn_cards = Card.where(set: 'EMN').where("colors like ?", "%Black%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "emn/index"
  end

  def green
    @title="Green Oath of the Gatewatch Card List"
    @emn_cards = Card.where(set: 'EMN').where("colors like ?", "%Green%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "emn/index"
  end

  def white
    @title="White Oath of the Gatewatch Card List"
    @emn_cards = Card.where(set: 'EMN').where("colors like ?", "%White%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "emn/index"
  end

  def colorless
    @title="Colorless Oath of the Gatewatch Card List"
    @emn_cards = Card.where(set: 'EMN').where("cmc = ?", "%C%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "emn/index"
  end

  def artifact
    @title="Artifact Oath of the Gatewatch Card List"
    @emn_cards = Card.where(set: 'EMN').where("types like ?", "%Artifact%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "emn/index"
  end

end
