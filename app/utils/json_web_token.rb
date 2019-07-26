require 'jwt'

class JsonWebToken

  # payload format:
  # {:user => user.email, :password => password, :exp => expires}
  #
  ALGORITHM = 'HS256'

  # Move this secret into secret config
  SECRET_KEY = 'This_is_a_secret'

  def self.encode(user)
    expires = Time.now.to_i + (3600 * 24 * 365)
    JWT.encode(
        {:email => user.email, :exp => expires},
        SECRET_KEY)
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(
  JWT.decode(
              token,
              SECRET_KEY,
              true,
              {algorithm: ALGORITHM}).first
    )
  rescue
    nil
  end
end