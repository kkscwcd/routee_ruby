require_relative 'routee_service'

class RouteeTwoStepVerificationService < RouteeService

  def self.getInstance
    @instance ||= RouteeTwoStepVerificationService.new(nil, 'https://connect.routee.net/2step')
  end

  def init2StepVerification(token, verificationData)
    response = RestClient.post(baseUrl, verificationData, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def get2StepVerificationStatus(token, trackingId)
    response = RestClient.get(baseUrl + '/' + trackingId, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def cancel2StepVerification(token, trackingId)
    response = RestClient.delete(baseUrl + '/' + trackingId, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def confirm2StepVerification(token, trackingId, bodyData)
    response = RestClient.post(baseUrl + '/' + trackingId, bodyData, {'content-type': 'application/x-www-form-urlencoded', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def retrieve2StepAccountReports(token)
    response = RestClient.get(baseUrl + '/reports', {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def retrieve2StepApplicationReports(token, appId)
    response = RestClient.get(baseUrl + '/reports/applications/' + appId, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end
end