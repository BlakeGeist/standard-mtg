class Import_ebay_info < Thor

  require  File.expand_path('config/environment.rb')

  desc 'recent ebay sales', 'recent_ebay_sales'

  def recent_ebay_sales
    require File.expand_path('config/environment.rb')
    require 'nokogiri'
    require 'net/http'

    @cards = Card.all

    @cards.each do |card|
      begin
       card_name = card.name

       finder = Rebay2::Finding.new

       response = finder.find_completed_items(
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

end
