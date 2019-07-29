class ApplicationController < ActionController::API
  include ::MyErrors

  rescue_from CustomError do |ex|
    render json: {error: ex.error, message: ex.message}, status: ex.status
  end
end