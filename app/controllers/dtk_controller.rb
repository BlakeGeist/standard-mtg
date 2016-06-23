class DtkController < ApplicationController
  def index
    @title="Dragons of Tarkir Card List"
    @dtk_cards = Card.where(set: 'DTK').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end

  def red
    @title="Red Dragons of Tarkir Card List"
    @dtk_cards = Card.where(set: 'DTK').where("colors like ?", "%Red%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "dtk/index"
  end

  def blue
    @title="Blue Dragons of Tarkir Card List"
    @dtk_cards = Card.where(set: 'DTK').where("colors like ?", "%Blue%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "dtk/index"
  end

  def black
    @title="Black Dragons of Tarkir Card List"
    @dtk_cards = Card.where(set: 'DTK').where("colors like ?", "%Black%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "dtk/index"
  end

  def green
    @title="Green Dragons of Tarkir Card List"
    @dtk_cards = Card.where(set: 'DTK').where("colors like ?", "%Green%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "dtk/index"
  end

  def white
    @title="White Dragons of Tarkir Card List"
    @dtk_cards = Card.where(set: 'DTK').where("colors like ?", "%White%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "dtk/index"
  end

  def colorless
    @title="Colorless Dragons of Tarkir Card List"
    @dtk_cards = Card.where(set: 'DTK').where("colors like ?", "").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "dtk/index"
  end

end
