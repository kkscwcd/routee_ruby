require 'base64'
require 'json'
require 'rest-client'
require_relative '../utils/rest_client_ext'
require_relative '../utils/routee_request_result'

class RouteeService

  attr_accessor :baseUrl, :authenticationBaseUrl, :rootUrl

  def initialize(authenticationBaseUrl, baseUrl)
    @baseUrl, @authenticationBaseUrl = baseUrl, authenticationBaseUrl
    if baseUrl then
      uri = URI.parse(baseUrl)
      @rootUrl =  uri.scheme + '://' + uri.host
    end
  end
end