class OgwController < ApplicationController
  def index
    @title="Oath of the Gatewatch Card List"
    @ogw_cards = Card.where(set: 'OGW').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end

  def red
    @title="Red Oath of the Gatewatch Card List"
    @ogw_cards = Card.where(set: 'OGW').where("colors like ?", "%Red%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ogw/index"
  end

  def blue
    @title="Blue Oath of the Gatewatch Card List"
    @ogw_cards = Card.where(set: 'OGW').where("colors like ?", "%Blue%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ogw/index"
  end

  def black
    @title="Black Oath of the Gatewatch Card List"
    @ogw_cards = Card.where(set: 'OGW').where("colors like ?", "%Black%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ogw/index"
  end

  def green
    @title="Green Oath of the Gatewatch Card List"
    @ogw_cards = Card.where(set: 'OGW').where("colors like ?", "%Green%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ogw/index"
  end

  def white
    @title="White Oath of the Gatewatch Card List"
    @ogw_cards = Card.where(set: 'OGW').where("colors like ?", "%White%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ogw/index"
  end

  def colorless
    @title="Colorless Oath of the Gatewatch Card List"
    @ogw_cards = Card.where(set: 'OGW').where("cmc = ?", "%C%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ogw/index"
  end

  def artifact
    @title="Artifact Oath of the Gatewatch Card List"
    @ogw_cards = Card.where(set: 'OGW').where("types like ?", "%Artifact%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ogw/index"
  end

end
