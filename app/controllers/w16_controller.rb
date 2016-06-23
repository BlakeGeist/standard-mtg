class W16Controller < ApplicationController
  def index
    @title="Welcome Deck 2016 Card List"
    @w16_cards = Card.where(set: 'W16').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 21)
  end

  def red
    @w16_cards = Card.where(set: 'W16').where("colors like ?", "%Red%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "w16/index"
  end

  def blue
    @w16_cards = Card.where(set: 'W16').where("colors like ?", "%Blue%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "w16/index"
  end

  def black
    @w16_cards = Card.where(set: 'W16').where("colors like ?", "%Black%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "w16/index"
  end

  def green
    @w16_cards = Card.where(set: 'W16').where("colors like ?", "%Green%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "w16/index"
  end

  def white
    @w16_cards = Card.where(set: 'W16').where("colors like ?", "%White%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "w16/index"
  end

  def colorless
    @w16_cards = Card.where(set: 'W16').where("colors like ?", "").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "w16/index"
  end

end
