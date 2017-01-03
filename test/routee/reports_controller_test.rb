# Created by Ing. Tatioti Mbogning Raoul(tatiotir@gmail.com, tatioti.raoul@gmail.com)

class ReportsControllerTest

  def initialize(reportsController)
    @controller = reportsController
    @logger = Logger.new(STDOUT)
  end

  def runTests
    getVolPriceForMessages()
    getVolPriceForCountry()
    getVolPriceForCountryAndNetwork()
    getVolPriceForCampaign()
    getTimeSummaryForMessages()
    getTimeSummaryForCountry()
    getTimeSummaryForCountryAndNetwork()
    getTimeSummaryForCampaign()
  end

  def getVolPriceForMessages
    response = @controller.getVolPriceForMessages('2016-01-01T00:00:00.000Z', '2016-01-31T00:00:00.000Z')
    @logger.info('getVolPriceForMessages --> ' + response.jsonBody.to_json)
  end

  def getVolPriceForCountry
    response = @controller.getVolPriceForCountry('2016-01-01T00:00:00.000Z', '2016-01-31T00:00:00.000Z', '202')
    @logger.info('getVolPriceForCountry --> ' + response.jsonBody.to_json)
  end

  def getVolPriceForCountryAndNetwork
    response = @controller.getVolPriceForCountryAndNetwork('2016-01-01T00:00:00.000Z', '2016-01-31T00:00:00.000Z', '202', '08')
    @logger.info('getVolPriceForCountryAndNetwork --> ' + response.jsonBody.to_json)
  end

  def getVolPriceForCampaign
    response = @controller.getVolPriceForCampaign('+02:00', '7c22af9e-d998-4d69-a4ea-574037294d45')
    @logger.info('getVolPriceForCampaign --> ' + response.jsonBody.to_json)
  end

  def getTimeSummaryForMessages
    response = @controller.getTimeSummaryForMessages('2016-01-01T00:00:00.000Z', '2016-01-31T00:00:00.000Z')
    @logger.info('getTimeSummaryForMessages --> ' + response.jsonBody.to_json)
  end

  def getTimeSummaryForCountry
    response = @controller.getTimeSummaryForCountry('2016-01-01T00:00:00.000Z', '2016-01-31T00:00:00.000Z','GR')
    @logger.info('getTimeSummaryForCountry --> ' + response.jsonBody.to_json)
  end

  def getTimeSummaryForCountryAndNetwork
    response = @controller.getTimeSummaryForCountryAndNetwork('2016-01-01T00:00:00.000Z', '2016-01-31T00:00:00.000Z', '202', '08')
    @logger.info('getTimeSummaryForCountryAndNetwork --> ' + response.jsonBody.to_json)
  end

  def getTimeSummaryForCampaign
    response = @controller.getTimeSummaryForCampaign('7c22af9e-d998-4d69-a4ea-574037294d45')
    @logger.info('getTimeSummaryForCampaign --> ' + response.jsonBody.to_json)
  end
end