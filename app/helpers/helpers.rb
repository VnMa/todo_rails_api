module Helpers
  include ::MyErrors

  def hello_helper
    'hello helper'
  end

  def authenticate_request_token!
    p "request: #{request.headers['Authorization']}"
    if request.headers['Authorization'].present?
      http_token
    else
      raise CustomError.new(status: 401, error: 401, message: 'Unauthorize')
    end
  end

  def http_token
    if request.headers['Authorization'].present?
      json_token = request.headers['Authorization'].split(' ').last
      decoded_data = JsonWebToken.decode(json_token)

      p "decoded_data: #{decoded_data}"
      unless decoded_data.nil?
        @current_user = User.find_by(email: decoded_data["email"])
      end
      decoded_data.nil? ? nil : decoded_data
    end
  end

  def current_user

  end
end