class DashboardsController < ApplicationController
 include PcardsHelper
 include EbayHelper

  def index
    require 'ebayr'

    Ebayr.dev_id = "a036b866-4e0d-49de-b7f6-a45309064be2"

    Ebayr.app_id = "BlakeGei-standard-PRD-ee6e394ea-800e1243"

    Ebayr.cert_id = "PRD-bff3fe44f0ea-09ae-470f-9222-6e2c"

    Ebayr.ru_name = "Blake_Geist-BlakeGei-standa-oysusnr"

    Ebayr.sandbox = false

    if(session["dick"])

      @GetOrders = Ebayr.call(:GetMyeBaySelling, :auth_token => session["dick"]["info"]["ebay_token"], :ActiveList => [:Sort => 'TimeLeft', :Pagination => [:EntriesPerPage => 200, :PageNumber => 1]])

    end

    $colors = Color.all
    $mechanics = Mechanic.all
    $subtypes = Subtype.all
    $rarities = Crarity.all
    #$standard = Standard.all

    @users_cards = current_user.pcards.pluck(:card_id, :amount)

    @this_cards = Card.where(multiverseid: @users_cards);

    @search = @this_cards.ransack(params[:q])

    @the_cards = @search.result(distinct: true)

    if current_user.pcards.count > 0
      @cards = @the_cards.sort_by{ |t| [t.avgprice.to_i] }.reverse.paginate(:page => params[:page], :per_page => 24)
    end

    @subtypes = Subtype.all

    if current_user.admin?

      @cards = Card.all.sort_by{ |t| [t.colors.count] }

      render action: "admin_index"

    end
  end

  def findItemsByKeywords

    require 'Rebay'

    finder = Rebay::Finding.new
    respnose = finder.find_items_by_keywords({:keywords => 'acordian'})

    @this = response.body

  end

  def ebayRequest

    require 'ebayr'
    require 'nokogiri'
    require 'rest_client'
    require 'base64'
    require 'rexml/document'

    Ebayr.dev_id = "a036b866-4e0d-49de-b7f6-a45309064be2"

    Ebayr.app_id = "BlakeGei-standard-PRD-ee6e394ea-800e1243"

    Ebayr.cert_id = "PRD-bff3fe44f0ea-09ae-470f-9222-6e2c"

    Ebayr.ru_name = "Blake_Geist-BlakeGei-standa-oysusnr"

    Ebayr.sandbox = false

    multiverseid = params[:multiverseid]

    card = Card.find_by! multiverseid: multiverseid

    if card.image_url_normal.to_s.include? '&type'

      photo_name = card.image_url_normal.gsub!('&','&amp;')

    else

      photo_name = card.image_url_normal

    end

    @this = Ebayr.call(
      :AddItem,
      :Item => [
        :AutoPay => true,
        :BuyerRequirementDetails => [
          :ShipToRegistrationCountry => true
        ],
        :ConditionDescription => 'Used',
        :ConditionID => "3000",
        :StartPrice => "#{params[:price]}",
        :Title => "#{params[:title]}",
        :Country => 'US',
        :Currency => 'USD',
        :Description => "#{REXML::Text.new(params[:description], false, nil, false)}",
        :DispatchTimeMax => '3',
        :HitCounter => 'NoHitCounter',
        :ItemSpecifics => [
          :NameValueList => [
            :Name => 'Condition',
            :Value => 'Used'
          ]
        ],
        :ListingDuration => 'Days_30',
        :ListingType => 'FixedPriceItem',
        :LiveAuction => false,
        :Location => 'Vancouver, Washington',
        :PaymentMethods => 'PayPal',
        :PayPalEmailAddress => session["dick"]["info"]["email"],
        :PictureDetails => [
          :ExternalPictureURL => "#{card.image_url_normal}"
        ],
        :PostalCode => '98682',
        :PrimaryCategory => [
          :CategoryID => '38292'
        ],
        :PrivateListing => false,
        :ProductListingDetails => [
          :Quantity => '3'
        ],
        :ReturnPolicy => [
          :ReturnsAcceptedOption => 'ReturnsNotAccepted'
        ],
        :ShippingDetails => [
          :SalesTax => [
            :SalesTaxPercent => 6.5,
            :SalesTaxState => 'WA',
            :ShippingIncludedInTax => false
          ],
          :ShippingServiceOptions => [
            :FreeShipping => true,
            :ShippingService => 'USPSParcel',
            :ShippingServiceAdditionalCost => '0.0',
            :ShippingServiceCost => '0.0',
            :ShippingServicePriority => '1'
          ],
          :ShippingType => 'Flat',
          :ShippingPackageDetails => [
            :ShippingIrregular => false,
            :ShippingPackage => "Letter",
            :WeightMajor => "0",
            :WeightMinor => "0"
          ],
          :ShipToLocations => "US",
          :Site => "US"
        ]
      ],
      :auth_token => session["dick"]["info"]["ebay_token"]
    )

    respond_to do |format|
      format.js
    end

  end


end
