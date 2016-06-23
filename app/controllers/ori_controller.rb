class OriController < ApplicationController
  def index
    @title="Magic Origins Card List"
    @ori_cards = Card.where(set: 'ORI').sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
  end

  def red
    @ori_cards = Card.where(set: 'ORI').where("colors like ?", "%Red%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

  def blue
    @ori_cards = Card.where(set: 'ORI').where("colors like ?", "%Blue%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

  def black
    @ori_cards = Card.where(set: 'ORI').where("colors like ?", "%Black%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

  def green
    @ori_cards = Card.where(set: 'ORI').where("colors like ?", "%Green%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

  def white
    @ori_cards = Card.where(set: 'ORI').where("colors like ?", "%White%").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

  def colorless
    @ori_cards = Card.where(set: 'ORI').where("colors like ?", "").sort_by{ |t| t.number }.paginate(:page => params[:page], :per_page => 28)
    render template: "ori/index"
  end

end
