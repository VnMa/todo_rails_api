module MyErrors
  def hello_errors
    "hello #{__method__}"
  end

  class CustomError < StandardError
    attr_reader :error, :status, :message
    def initialize(options = {})
      @error = options[:error] || 422
      @status = options[:status] || :unprocessable_entity
      @message = options[:message] || 'There is an error! Please contact support@wthapps.com!'
    end
  end
end