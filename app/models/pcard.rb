class Pcard < ActiveRecord::Base
  belongs_to :user

  validates :card_id, uniqueness: { scope: :user,
      message: "This card is already added to your collection" }

   
end
