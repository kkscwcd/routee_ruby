require_relative 'routee_service'

# Created by Ing. Tatioti Mbogning Raoul(tatiotir@gmail.com, tatioti.raoul@gmail.com)

class RouteeAuthenticationService < RouteeService

  def authenticateApplication(appId, appSecret)
    response = RestClient.post(authenticationBaseUrl + '/oauth/token', 'grant_type=client_credentials', {'content-type': 'application/x-www-form-urlencoded', 'authorization': 'Basic ' + Base64.encode64(appId + ':' + appSecret)}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def self.getInstance
    @instance ||= RouteeAuthenticationService.new('https://auth.routee.net', nil)
  end
end