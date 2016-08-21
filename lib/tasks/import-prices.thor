class Import_price < Thor

  desc 'tcg', 'get updat_tcg_prices'

  def tcg

    require File.expand_path('config/environment.rb')
    require 'nokogiri'
    require 'net/http'

    @cards = Card.all

    @cards.each do |card|

      card_name = card.name
      if card.name.include? " "
        card_name = card.name.gsub!(" ", "%20")
      end

      card_set_name = card.setName
      if card.setName.include? " "
        card_set_name = card.setName.gsub!(" ", "%20")
      end

      source = "http://partner.tcgplayer.com/x3/phl.asmx/p?pk=StandardMTGCards&s=#{card_set_name}&p=#{card_name}"

      resp = Net::HTTP.get_response(URI.parse(source))
      @data = resp.body
      @doc = Nokogiri::XML(@data)

      hiprice = @doc.xpath("//hiprice").text

      if hiprice.blank?

        puts 'there is not pricing data'

      else

        lowprice = @doc.xpath("//lowprice").text
        avgprice = @doc.xpath("//avgprice").text
        foilavgprice = @doc.xpath("//foilavgprice").text

        card.tcg_prices.create(
          :hiprice => hiprice,
          :lowprice => lowprice,
          :avgprice => avgprice,
          :foilavgprice => foilavgprice
        )

      end

    end

  end

end
