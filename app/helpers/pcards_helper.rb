module PcardsHelper

  def get_total(cards)

    @total = Array.new

    cards.each do |card|

      unless card[0].nil?

        this_card = Card.find_by!(multiverseid: card[0]);


        if this_card.avgprice?

          @total.push(this_card.lowprice * card[1])

        end

      end

    end

   @total = @total.compact.sum

  end

end
