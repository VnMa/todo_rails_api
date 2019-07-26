class ApplicationController < ActionController::API
  include ::MyErrors

  rescue_from CustomError do |ex|
    render json: {error: ex.error, status: ex.status, message: ex.message}
  end
end