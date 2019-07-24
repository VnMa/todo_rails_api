class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      if (!user.activated)
        render :json => {success: false, error: 'Please check your email to activate account'}
      else
        render :json => {success: true, user: user}
      end
    else
      render :json => {success: false, error: 'Invalid username / password'}
    end
  end
end
