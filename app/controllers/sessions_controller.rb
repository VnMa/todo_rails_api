class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      render :json => {success: true, user: user}
    else
      render :json => {success: false, error: 'Invalid username / password'}
    end
  end
end
