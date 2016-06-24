class SoiController < ApplicationController
  def index
    @title="Shadows over Innistrad Card List"
    @soi_cards = Card.where(set: 'SOI').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
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

end
