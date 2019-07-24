class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate

      render :json => {success: true, info: 'Acccount activated', user: user}
    else
      render :json => {success: false, danger: 'Invalid activation link', user: user}
    end
  end

end
