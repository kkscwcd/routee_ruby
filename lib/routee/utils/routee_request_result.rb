class RouteeRequestResult
  attr_accessor :jsonBody, :statusCode

  def initialize(jsonBody, statusCode)
    @jsonBody, @statusCode = jsonBody, statusCode
  end
end