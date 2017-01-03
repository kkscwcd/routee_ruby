require_relative 'routee_service'

class RouteeMessagingService < RouteeService

  def self.getInstance
    @instance ||= RouteeMessagingService.new(nil, 'https://connect.routee.net/sms')
  end

  def sendSingleSms(token, smsData)
    response = RestClient.post(baseUrl, smsData, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def analyseSingleSms(token, smsData)
    response = RestClient.post(baseUrl + '/analyse', smsData, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def sendCampaign(token, campaignData)
    response = RestClient.post(baseUrl + '/campaign', campaignData, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def analyseCampaign(token, campaignData)
    response = RestClient.post(baseUrl + '/analyse/campaign', campaignData, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def trackSingleSms(token, messageId)
    response = RestClient.get(baseUrl + '/tracking/single/' + messageId, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def trackCampaignSms(token, campaignTrackingId, size, page, sort)
    query = ''
    if size then
      query += '?size=' + size
    end

    if page then
      if size then
        query += '&page=' + page
      else
        query += '?page=' + page
      end
    end

    if sort then
      if size || page then
        query += '&sort=' + sort
      else
        query += '?sort=' + sort
      end
    end

    response = RestClient.get(baseUrl + '/tracking/campaign/' + campaignTrackingId + query, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def trackMultipleSmsWithFilter(token, filterData, dateStart, dateEnd, size, page, sort, trackingId, campaign)
    query = ''
    if size then
      query += '?size=' + size
    end

    if page then
      if size then
        query += '&page=' + page
      else
        query += '?page=' + page
      end
    end

    if sort then
      if size || page then
        query += '&sort=' + sort
      else
        query += '?sort=' + sort
      end
    end

    if dateStart then
      if size || page || sort then
        query += '&dateStart=' + dateStart
      else
        query += '?dateStart=' + dateStart
      end
    end

    if dateEnd then
      if size || page || sort || dateStart then
        query += '&dateEnd=' + dateEnd
      else
        query += '?dateEnd=' + dateEnd
      end
    end

    if trackingId then
      if size || page || sort || dateStart || dateEnd then
        query += '&trackingId=' + trackingId
      else
        query += '?trackingId=' + trackingId
      end
    end

    if campaign then
      if size || page || sort || dateStart || dateEnd || trackingId then
        query += '&campaign=' + campaign
      else
        query += '?campaign=' + campaign
      end
    end

    response = RestClient.post(baseUrl + '/tracking' + query, filterData, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getSupportedCountriesByLanguage(token, language)
    response = RestClient.get(rootUrl + '/quietHours/countries/' + language, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def updateScheduledMessageCampaign(token, campaignTrackingId, campaignData)
    response = RestClient.put(baseUrl + '/' + campaignTrackingId, campaignData, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def deleteScheduledCampaign(token, trackingId)
    response = RestClient.delete(baseUrl + '/' + trackingId, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getCampaignDetails(token, trackingId)
    response = RestClient.get(rootUrl + '/campaigns' + trackingId, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

end