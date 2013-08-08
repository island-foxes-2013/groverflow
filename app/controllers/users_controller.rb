class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    mailgun_response = JSON.parse(get_validate(params[:user][:email])) # mailgun returns a string, convert to json
    if mailgun_response["is_valid"] == true
      User.create(params[:user])
      redirect_to root_path
    else
      flash[:invalid_email] = "your email address is invalid"
      @user = User.new(params[:user])
      render new_user_path
    end
    
  end



# Use the mailgun api to verify the client submitted email is correct. Documentation can be found here: http://documentation.mailgun.com/api-email-validation.html
  def get_validate(email)
    email = "address=" + email
    RestClient.get "https://api:pubkey-2-5pezoadgsxe0stc4bidm2cq417n-p5"\
    "@api.mailgun.net/v2/address/validate?#{email}"
  end


end
