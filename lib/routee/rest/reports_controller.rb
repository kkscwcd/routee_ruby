require_relative 'application_controller'
require_relative '../services/routee_reports_service'

# Created by Ing. Tatioti Mbogning Raoul(tatiotir@gmail.com, tatioti.raoul@gmail.com)

class ReportsController < ApplicationController

  #api! 'View Volume/Price summary analytics for a range of messages.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getVolPriceForMessages(startDate, endDate)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeReportsService.getInstance.getVolPriceForMessages(tokenResult.token, startDate, endDate)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'View Volume/Price summary analytics for a Country.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getVolPriceForCountry(startDate, endDate, mcc)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeReportsService.getInstance.getVolPriceForCountry(tokenResult.token, startDate, endDate, mcc)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'View Volume/Price summary analytics for a Country and Network.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getVolPriceForCountryAndNetwork(startDate, endDate, mcc, mnc)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeReportsService.getInstance.getVolPriceForCountryAndNetwork(tokenResult.token, startDate, endDate, mcc, mnc)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'View Volume/Price summary analytics for a campaign.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getVolPriceForCampaign(offset, campaignId)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeReportsService.getInstance.getVolPriceForCampaign(tokenResult.token, offset, campaignId)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'View Time summary analytics for a range of messages.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getTimeSummaryForMessages(startDate, endDate)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeReportsService.getInstance.getTimeSummaryForMessages(tokenResult.token, startDate, endDate)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'View Time summary analytics for a country.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getTimeSummaryForCountry(startDate, endDate, countryCode)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeReportsService.getInstance.getTimeSummaryForCountry(tokenResult.token, startDate, endDate, countryCode)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'View Time summary analytics for a country and a network.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getTimeSummaryForCountryAndNetwork(startDate, endDate, mcc, mnc)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeReportsService.getInstance.getTimeSummaryForCountryAndNetwork(tokenResult.token, startDate, endDate, mcc, mnc)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'View Time summary analytics for a campaign.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getTimeSummaryForCampaign(campaignId)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeReportsService.getInstance.getTimeSummaryForCampaign(tokenResult.token, campaignId)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end
end