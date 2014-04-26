class SessionsController < ApplicationController
  def new
    # Only for redirect to view
  end

  # sessions POST /sessions(.:format)
  def create
    # Find user by email
    user = User.find_by(email: params[:email])
    # Authenticate using authenticate(password) method
    if user && user.authenticate(params[:password])
      # Store cookies at session[:user_id] hash
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid."
      render 'new'
    end
  end

  def destroy
    # Force session hash to nil
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
