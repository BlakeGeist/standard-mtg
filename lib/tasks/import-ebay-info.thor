class Import_ebay_info < Thor

  require  File.expand_path('config/environment.rb')

  desc 'recent ebay sales', 'recent_ebay_sales'

  def recent_ebay_sales
    require 'nokogiri'
    require 'net/http'

    @cards = Card.all

    @cards.each do |card|
      begin
       card_name = card.name

       finder = Rebay2::Finding.new

       response = finder.find_completed_items (
         {
           :keywords => card.name,
           :itemFilter => [
             :name => "ListingType",
             :value => "AuctionWithBIN",
             :value => "FixedPrice"
           ]
         }
       )

       if response.success? && response.response
         @response = response.response['searchResult']['@count']
         puts card_name + ': ' + @response
         card.recent_ebay_purchases = @response
         card.save
       else
         @response = 0
         puts @response
       end

     end

   end

  end

  desc 'ebay_price', 'get ebay_price'

  def get_ebay_live_auction_count

    puts 'ebay price'
    @cards = Card.all
    @cards.each do |card|
      begin
       card_name = card.name
       finder = Rebay2::Finding.new
       response = finder.find_items_by_keywords (
         {
           :keywords => card_name,
           :itemFilter => [
             :name => "ListingType",
             :value => "AuctionWithBIN",
             :value => "FixedPrice"
           ]
         }
       )

       if response.success? && response.response['searchResult']['item']

         @response = response.response['searchResult']['item'].count

         card.live_ebay_auctions = @response

         card.save

         puts "#{card_name}: #{@response}"

       else

         @response = 0

         puts @response

       end

     end

   end

  end

  desc 'ebay_price', 'get ebay_price'

  def get_ebay_completed_count

    puts 'ebay price'
    @cards = Card.all
    @cards.each do |card|
      begin
       card_name = card.name
       finder = Rebay2::Finding.new
       response = finder.find_completed_items (
         {
           :keywords => card.name,
           :itemFilter => [
             :name => "ListingType",
             :value => "AuctionWithBIN",
             :value => "FixedPrice"
           ]
         }
       )

       if response.success? && response.response
         @response = response.response['searchResult']['@count']
         puts card_name + ': ' + @response
       else
         @response = 0
         puts @response
       end

     end

   end

  end

  desc 'get_ebay_low_price', 'get_ebay_low_price'

  def get_ebay_low_price

    puts 'get_ebay_low_price'
    @cards = Card.all
    @cards.each do |card|
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
           @response.each do |item|
             if item['listingInfo']['listingType'] === 'FixedPrice' || item['listingInfo']['listingType'] === 'StoreInventory'
               puts "#{card_name}: #{item['title']} #{item['sellingStatus']['currentPrice']['__value__']}"
             end
           end
         end
       else
         @response = 0
         puts @response
       end

     end

   end

  end

end
