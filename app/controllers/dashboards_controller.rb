class DashboardsController < ApplicationController
 include PcardsHelper
 include EbayHelper

  def index

    $colors = Color.all
    $mechanics = Mechanic.all
    $subtypes = Subtype.all
    $rarities = Crarity.all
    $standard = Standard.all

    @users_cards = current_user.pcards.pluck(:card_id, :amount)

    @this_cards = Card.where(multiverseid: @users_cards);

    @search = @this_cards.ransack(params[:q])

    @the_cards = @search.result(distinct: true)

    if current_user.pcards.count > 0
      @cards = @the_cards.sort_by{ |t| [t.avgprice.to_i] }.reverse.paginate(:page => params[:page], :per_page => 28)
    end

    @subtypes = Subtype.all

    if current_user.admin?

      @cards = Card.all.sort_by{ |t| [t.colors.count] }

      render action: "admin_index"

    end
  end

  def ebayRequest

    require 'ebayr'

    Ebayr.dev_id = "a036b866-4e0d-49de-b7f6-a45309064be2"

    Ebayr.app_id = "BlakeGei-standard-PRD-ee6e394ea-800e1243"

    Ebayr.cert_id = "PRD-bff3fe44f0ea-09ae-470f-9222-6e2c"

    Ebayr.ru_name = "Blake_Geist-BlakeGei-standa-oysusnr"

    Ebayr.sandbox = false

    @this = Ebayr.call(
      :VerifyAddFixedPriceItem,
      :auth_token => session["dick"]["info"]["ebay_token"],
      :Item => [
        :Country = "US",
        :Currency => "USD",
        :Description => 'Desc',
        :DispatchTimeMax => '3',
        :ListingDuration => 'GTC',
        :ListingType => 'FixedPriceItem',
        :PaymentMethods => 'PayPal',
        :PayPalEmailAddress => 'blakesmtg@gmail.com',
        :PostalCode => '98682',
        :PrimaryCategory = [
          :CategoryID => '38292',
          :CategoryName => 'Toys & Hobbies:Collectible Card Games:Magic: The Gathering:MTG Individual Cards'
        ],
        :Title => "This is the title",
        :PictureDetails => [
          :PictureURL => "http://i.ebayimg.com/00/s/MTAwMFg3NTA=/z/8lAAAOSwUKxYhK8P/$_12.JPG"
        ],
        :ReturnPolicy => [
          :ReturnsAcceptedOption => 'ReturnsNotAccepted',
          :ReturnsAccepted => 'No returns accepted'
        ],
        :ShippingDetails => [
          :PaymentInstructions => 'Payment must be received within 7 business days of purchase.',
          :SalesTax => [
            :SalesTaxPercent => '6.5',
            :SalesTaxState => 'WA'
          ],
          :ShippingServiceOptions => [
            :FreeShipping => true,
            :ShippingService => 'USPSPriority'
          ],
          :ItemSpecifics => [
            :NameValueList => [
              :Name => 'Condition',
              :Value => 'Used'
            ]
            :
          ]
        ]
      ]

    respond_to do |format|
      format.js
    end

  end


end
