class OriController < ApplicationController
  def index
    @title="Magic Origins Card List"
    @ori_cards = Card.where(set: 'ORI').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end

  def red
    @title="Red Magic Origins Card List"
    @ori_cards = Card.where(set: 'ORI').where("colors like ?", "%Red%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

  def blue
    @title="Blue Magic Origins Card List"
    @ori_cards = Card.where(set: 'ORI').where("colors like ?", "%Blue%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

  def black
    @title="Black Magic Origins Card List"
    @ori_cards = Card.where(set: 'ORI').where("colors like ?", "%Black%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

  def green
    @title="Green Magic Origins Card List"
    @ori_cards = Card.where(set: 'ORI').where("colors like ?", "%Green%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

  def white
    @title="White Magic Origins Card List"
    @ori_cards = Card.where(set: 'ORI').where("colors like ?", "%White%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

  def colorless
    @title="Colorless Magic Origins Card List"
    @ori_cards = Card.where(set: 'ORI').where("colors like ?", "").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

  def artifact
    @title="Artifact Magic Origins Card List"
    @ori_cards = Card.where(set: 'ORI').where("types like ?", "%Artifact%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

end
