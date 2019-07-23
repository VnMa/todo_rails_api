class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.valid?
      user.save
      render :json => {success: true, user: user}
    else
      render :json => {success: false, errors: user.errors.full_messages}
    end
  end

  def index
  end

  def show
  end

  private 
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
