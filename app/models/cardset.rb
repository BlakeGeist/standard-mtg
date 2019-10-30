class Cardset < ActiveRecord::Base
  extend FriendlyId
    friendly_id :short_name, use: :slugged
    has_many :cards,  dependent: :destroy

    def should_generate_new_friendly_id?
      new_record?
    end
end
