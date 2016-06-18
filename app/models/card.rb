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
end
