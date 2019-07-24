class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      @user.send_activation_email
      render :json => {success: true, info: 'Please check your email to activate your account', user: @user}
    else
      render :json => {success: false, errors: @user.errors.full_messages}
    end
  end

  def welcome
    @user = User.first
    # @url = 'http://somewhere.com'
    # email = UserMailer.with(user: @user).welcome_email.deliver_now
    render :json => {success: true, email: email}
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
