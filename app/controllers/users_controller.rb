class UsersController < ApplicationController
  before_filter :authorize, only: [:show, :edit]

  # new_user GET /user/new(.:format)
  def new
    @user = User.new
  end

  # user GET /users/:id(.:format)
  def show
    @user = User.find(params[:id])
  end

  # edit_user GET /users/:id/edit(.:format)
  def edit
    @user = User.find(params[:id])
  end

  # articles GET /users(.:format)
  def index
    @users = User.all
  end

  # users POST /sessions(.:format)
  def create
    @user = User.new(user_params)
    # Saving user to database
    if @user.save
      # Store in session hash for automatic log in after sign up
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thank you for signing up!"
    else
      render 'new'
    end
  end

  # user PUT /users/:id(.:format)
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "User info has been updated!"
    else
      render 'edit'
    end
  end

  # user DELETE /users/:id(.:format)
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url, notice: "User has been deleted!"
  end

  private
  # Strong parameters
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
