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


end
