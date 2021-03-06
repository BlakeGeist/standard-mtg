class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def ebay
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      session["dick"] = request.env['omniauth.auth'] 
      sign_in_and_redirect @user #this will throw if @user is not activated
    else
      session["devise.ebay_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
