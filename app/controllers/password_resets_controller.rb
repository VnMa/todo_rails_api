class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email

      render :json => {success: true, info: 'Email sent with password reset instructions'}
    else
      # flash.now[:danger] = "Email address not found"
      # render 'new'
      render :json => {success: false, danger: 'Email address not found'}
    end
  end

  def edit
  end
end
