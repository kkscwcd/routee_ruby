require_relative 'routee_service'

class RouteeReportsService < RouteeService

  def self.getInstance
    @instance ||= RouteeReportsService.new(nil, 'https://connect.routee.net/reports')
  end

  def getVolPriceForMessages(token, startDate, endDate)
    query = '?startDate=' + startDate + '&endDate=' + endDate
    response = RestClient.get(baseUrl + '/my/volPrice' + query, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getVolPriceForCountry(token, startDate, endDate, mcc)
    query = '?startDate=' + startDate + '&endDate=' + endDate + '&mcc=' + mcc
    response = RestClient.get(baseUrl + '/my/volPrice/perMcc' + query, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getVolPriceForCountryAndNetwork(token, startDate, endDate, mcc, mnc)
    query = '?startDate=' + startDate + '&endDate=' + endDate + '&mcc=' + mcc + '&mnc=' + mnc
    response = RestClient.get(baseUrl + '/my/volPrice/perMccMnc' + query, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getVolPriceForCampaign(token, offset, campaignId)
    query = '?offset=' + offset + '&campaignId=' + campaignId
    response = RestClient.get(baseUrl + '/my/volPrice/perCampaign' + query, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getTimeSummaryForMessages(token, startDate, endDate)
    query = '?startDate=' + startDate + '&endDate=' + endDate
    response = RestClient.get(baseUrl + '/my/latency' + query, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getTimeSummaryForCountry(token, startDate, endDate, countryCode)
    query = '?startDate=' + startDate + '&endDate=' + endDate + '&countryCode=' + countryCode
    response = RestClient.get(baseUrl + '/my/latency/perCountry' + query, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getTimeSummaryForCountryAndNetwork(token, startDate, endDate, mcc, mnc)
    query = '?startDate=' + startDate + '&endDate=' + endDate + '&mcc=' + mcc + '&mnc=' + mnc
    response = RestClient.get(baseUrl + '/my/latency/perMccMnc' + query, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getTimeSummaryForCampaign(token, campaignId)
    query = '?campaignId=' + campaignId
    response = RestClient.get(baseUrl + '/my/latency/perCampaign' + query, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end
end