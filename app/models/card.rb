class Card < ActiveRecord::Base
  serialize :info, Hash
  serialize :supertypes, Array
  serialize :subtypes, Array
  serialize :types, Array
  serialize :colors, Array
  serialize :printings, Array
  serialize :legalities, Array
  serialize :rulings, Array
  serialize :foreignNames, Array

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end

  def menace
    @title="Menace Standard Card List | MTG"
    @cards = Card.where('set=? OR set=? OR set=? OR set=? OR set=? OR set=?', 'SOI', 'W16', 'OGW', 'BFZ', 'ORI', 'DTK').where("text like ?", '%Menace%').sort_by{ |t| [t.cmc.to_i, t.colors] }.paginate(:page => params[:page], :per_page => 28)
    render template: "cards/index"
  end
end
