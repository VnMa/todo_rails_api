class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      user.remember
      jwt_data = JsonWebToken.encode(user)
      render :json => {success: true, jwt_data: jwt_data, remember_token: user.remember_token}
    else
      render :json => {success: false, error: 'Invalid username / password'}, status: 401
    end
  end
end
