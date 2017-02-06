class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:ebay]

  has_many :pcards

  def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.ebay_data"]
       user.email = data["email"] if user.email.blank?
     end
   end
  end

  def self.from_omniauth(auth)
    where(provider: auth.ebay, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.provider = 'ebay'
      user.ebay_token = auth.info.ebaytkn
    end
  end

end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def ebay
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Ebay") if is_navigational_format?
    else
      session["devise.ebay_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
