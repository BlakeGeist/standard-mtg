class SoiController < ApplicationController
  def index
    @title="Shadows over Innistrad Card List"
    @soi_cards = Card.where(set: 'SOI').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end

  def red
    @soi_cards = Card.where("colors like ?", "%Red%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

  def blue
    @soi_cards = Card.where("colors like ?", "%Blue%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

  def black
    @soi_cards = Card.where("colors like ?", "%Black%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

  def green
    @soi_cards = Card.where("colors like ?", "%Green%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

  def white
    @soi_cards = Card.where("colors like ?", "%White%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

  def colorless
    @soi_cards = Card.where("colors like ?", "").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "soi/index"
  end

end
