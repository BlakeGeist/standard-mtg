class Deck < ActiveRecord::Base
  belongs_to :user
  extend FriendlyId
  friendly_id :name, use: :slugged

  serialize :card_ids, Array

end
