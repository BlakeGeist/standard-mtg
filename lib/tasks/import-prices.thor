class Import_price < Thor

  desc 'fix_names', 'get fix_names'

  def fix_names

    require File.expand_path('config/environment.rb')
    require 'nokogiri'
    require 'net/http'

    @cards = Card.all

    @cards.each do |card|
      if card.name?
        begin
          card_name = card.name
          if card.name.include? "%20"
            card.name = card.name.gsub!("%20", " ")
          end
          puts card.name
          card.save
        end
      end
    end

  end

  desc 'tcg', 'get updat_tcg_prices'

  def tcg

    require File.expand_path('config/environment.rb')
    require 'nokogiri'
    require 'net/http'

    @cards = Card.all

    @cards.each do |card|
      begin
        card_name = card.name
        if card.name.include? " "
          card_name = card_name.gsub!(" ", "%20")
        end

        card_set_name = card.setName
        if card.setName.include? " "
          card_set_name = card_set_name.gsub!(" ", "%20")
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

          puts "#{card.name} #{lowprice}"

          card.tcg_prices.create(
            :hiprice => hiprice,
            :lowprice => lowprice,
            :avgprice => avgprice,
            :foilavgprice => foilavgprice
          )

          card.lowprice = lowprice
          card.hiprice = hiprice
          card.avgprice = avgprice

          card.save

        end
      rescue URI::InvalidURIError => err
        p err
      end

    end

  end

end