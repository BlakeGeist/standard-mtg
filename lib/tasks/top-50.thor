class Scrape < Thor

  desc "scrape the top 50", "scrape the top 50 standard mtg cards"
  def top_50

    require File.expand_path('config/environment.rb')

    require 'rubygems'

    require 'nokogiri'

    require 'open-uri'

    require 'csv'

    require 'json'

    require 'watir'

    puts 'getting the top 50 cards'

    browser = Watir::Browser.new :phantomjs

    browser.goto "https://www.mtggoldfish.com/format-staples/standard/full/all"

    doc = Nokogiri::HTML browser.html

		cards = doc.css('.col-card a')

    cards.each do |card|

      system_card = Card.find_by_name(card.text)

      if system_card

        if system_card.tcg_prices && system_card.tcg_prices.last && system_card.tcg_prices.last.avgprice

          puts system_card.name

          puts system_card.tcg_prices.last.avgprice

          puts get_ebay_low_price(system_card)

        end

      else
        puts "card not found!"
      end
    end

  end

  desc 'get_ebay_low_price', 'get_ebay_low_price'

  def get_ebay_low_price(card)

    puts 'get_ebay_low_price'
    begin
     card_name = card.name
     finder = Rebay2::Finding.new
     response = finder.find_items_by_keywords (
       {
         :sortOrder => "PricePlusShippingAsc",
         :itemFilter => [
           :name => "ListingType",
           :value => "FixedPrice"
         ],
         :keywords => card_name
       }
     )

     if response.success? && response.response
       @response = response.response['searchResult']['item']

       if @response.count > 1
         results = Array.new
         @response.each do |item|
           if item['listingInfo']['listingType'] === 'FixedPrice' || item['listingInfo']['listingType'] === 'StoreInventory'
             results.push("#{item['sellingStatus']['currentPrice']['__value__']} #{item['viewItemURL']}")
           end
         end
         return results
       end
     else
       @response = 0
     end

   end

 end

end
