module PcardsHelper

  def get_total(cards)

    @total = Array.new

    cards.each do |card|

      unless card[0].nil?

        this_card = Card.find_by!(multiverseid: card[0]);


        if this_card.avgprice?

          @total.push(this_card.avgprice * card[1])

        end

      end

    end

   @total = @total.compact.sum

  end

  def getCardSpread(card_price, pcard_price)

    num = (pcard_price / card_price * 100).to_s.to_f.round - 100

    if num > 0

      return '+' + num.to_s + '%'

    else

      return num.to_s + '%'

    end

  end

  def getCardHigh(card)

    avgPrices = Array.new

    card.tcg_prices.each do |price|

      avgPrices.push(price.avgprice)

    end

    return avgPrices.max

  end

  def getCardLow(card)

    avgPrices = Array.new

    card.tcg_prices.each do |price|

      avgPrices.push(price.avgprice)

    end

    return avgPrices.min

  end

end
