class BfzController < ApplicationController
  def index
    @title="Battle for Zendikar Card List"
    @bfz_cards = Card.where(set: 'BFZ').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end

  def red
    @title="Red Battle for Zendikar Card List"
    @bfz_cards = Card.where(set: 'BFZ').where("colors like ?", "%Red%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "bfz/index"
  end

  def blue
    @title="Blue Battle for Zendikar Card List"
    @bfz_cards = Card.where(set: 'BFZ').where("colors like ?", "%Blue%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "bfz/index"
  end

  def black
    @title="Black Battle for Zendikar Card List"
    @bfz_cards = Card.where(set: 'BFZ').where("colors like ?", "%Black%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "bfz/index"
  end

  def green
    @title="Green Battle for Zendikar Card List"
    @bfz_cards = Card.where(set: 'BFZ').where("colors like ?", "%Green%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "bfz/index"
  end

  def white
    @title="White Battle for Zendikar Card List"
    @bfz_cards = Card.where(set: 'BFZ').where("colors like ?", "%White%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "bfz/index"
  end

  def artifact
    @title="Artifact Battle for Zendikar Card List"
    @bfz_cards = Card.where(set: 'BFZ').where("types like ?", "%Artifact%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "bfz/index"
  end

end
