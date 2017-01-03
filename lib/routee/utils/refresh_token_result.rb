
# Created by Ing. Tatioti Mbogning Raoul(tatiotir@gmail.com, tatioti.raoul@gmail.com)

class RefreshTokenResult

  attr_accessor :error, :token, :statusCode

  def initialize(token, error, statusCode)
    @token, @error, @statusCode = token, error, statusCode
  end
end