require_relative 'application_controller'
require_relative '../services/routee_messaging_service'

# Created by Ing. Tatioti Mbogning Raoul(tatiotir@gmail.com, tatioti.raoul@gmail.com)

class MessagingController < ApplicationController

  #api! 'Sends single Message'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def sendSingleSms(smsData)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeMessagingService.getInstance.sendSingleSms(tokenResult.token, smsData)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! "Checks a message for validity and analyzes the cost and actual message (if it's unicode etc.)."
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def analyseSingleSms(smsData)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeMessagingService.getInstance.analyseSingleSms(tokenResult.token, smsData)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Sends an SMS campaign.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def sendCampaign(campaignData)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeMessagingService.getInstance.sendCampaign(tokenResult.token, campaignData)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! "Checks a campaign for validity and analyzes the recipients of the campaign as well as the actual message (if it's unicode etc.)."
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def analyseCampaign(campaignData)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeMessagingService.getInstance.analyseCampaign(tokenResult.token, campaignData)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Tracks the messages (parts) of a single SMS'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def trackSingleSms(messageId)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeMessagingService.getInstance.trackSingleSms(tokenResult.token, messageId)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Tracks multiple SMS that belong to a specific campaign'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def trackCampaignSms(campaignTrackingId, size, page, sort)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeMessagingService.getInstance.trackCampaignSms(tokenResult.token, campaignTrackingId, size, page, sort)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! "Searches for messages but with more advanced search filters that are passed as request body."
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def trackMultipleSmsWithFilter(filterData, dateStart, dateEnd, size, page, sort, trackingId, campaign)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeMessagingService.getInstance.trackMultipleSmsWithFilter(tokenResult.token, filterData, dateStart, dateEnd, size, page, sort, trackingId, campaign)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! "Retrieves all the countries that are supported by the quiet hours feature."
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getSupportedCountriesByLanguage(language)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeMessagingService.getInstance.getSupportedCountriesByLanguage(tokenResult.token, language)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! "Edits the campaign with the provided tracking id. The campaign status must be \"Scheduled\" in order to be edited."
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def updateScheduledMessageCampaign(campaignTrackingId, campaignData)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeMessagingService.getInstance.updateScheduledMessageCampaign(tokenResult.token, campaignTrackingId, campaignData)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! "Deletes a scheduled Campaign."
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def deleteScheduledCampaign(trackingId)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeMessagingService.getInstance.deleteScheduledCampaign(tokenResult.token, trackingId)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! "Retrieve details for a specific campaign."
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getCampaignDetails(trackingId)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeMessagingService.getInstance.getCampaignDetails(tokenResult.token, trackingId)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

end