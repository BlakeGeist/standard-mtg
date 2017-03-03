class Import_price < Thor

  desc 'create_base_pcard_price', 'get fix_names'

  def create_base_pcard_price

    require File.expand_path('config/environment.rb')

    @pcards = Pcard.all

    @pcards.each do |card|

      if card.card_id

        origional_card = Card.find_by! multiverseid: card.card_id

        if origional_card && origional_card.tcg_prices && origional_card.tcg_prices.last && origional_card.tcg_prices.last.avgprice

          card.price = origional_card.tcg_prices.last.avgprice

          puts origional_card.name

          puts card.price

          card.save

        end

      end

    end

  end

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
        if card_name and card_name.include? " "
          card_name.gsub!(" ", "%20")
        end

        card_set_name = card.setName
        if card_set_name and card_set_name.include? " "
          card_set_name.gsub!(" ", "%20")
        end

        source = "http://partner.tcgplayer.com/x3/phl.asmx/p?pk=StandardMTGCards&s=#{card_set_name}&p=#{card_name}"
        resp = Net::HTTP.get_response(URI.parse(source))
        @data = resp.body
        @doc = Nokogiri::XML(@data)

        if card.name and card.name.include? "%20"
          card.name.gsub!("%20", " ")
        end

        if card.setName and card.setName.include? "%20"
          card.setName.gsub!("%20", " ")
        end

        hiprice = @doc.xpath("//hiprice").text

        if hiprice.blank?

          puts 'there is not pricing data'

        else

          lowprice = @doc.xpath("//lowprice").text
          avgprice = @doc.xpath("//avgprice").text
          foilavgprice = @doc.xpath("//foilavgprice").text
          link = @doc.xpath("//link").text

          puts "#{card.name} #{lowprice}"

          card.tcg_prices.create(
            :hiprice => hiprice,
            :lowprice => lowprice,
            :avgprice => avgprice,
            :foilavgprice => foilavgprice,
            :link => link
          )

          card.lowprice = lowprice
          card.hiprice = hiprice
          card.avgprice = avgprice
          card.link = link

          card.save

        end
      rescue URI::InvalidURIError => err
        p err
      end

    end

  end

end
