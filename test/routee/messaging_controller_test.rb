# Created by Ing. Tatioti Mbogning Raoul(tatiotir@gmail.com, tatioti.raoul@gmail.com)

class MessagingControllerTest

  def initialize(messagingController)
    @controller = messagingController
    @logger = Logger.new(STDOUT)
  end

  def runTests
    sendSingleSms()
    analyseSingleSms()
    sendCampaign()
    analyseCampaign()
    trackSingleSms()
    trackCampaignSms()
    trackMultipleSmsWithFilter()
    getSupportedCountriesByLanguage()
    updateScheduledMessageCampaign()
    deleteScheduledCampaign()
    getCampaignDetails()
  end

  def sendSingleSms
    response = @controller.sendSingleSms({ :body => "A new game has been posted to the MindPuzzle. Check it out", :to => "+306973359355", :from => "amdTelecom", :callback => { :strategy => "OnChange", :url => "http://www.yourserver.com/message"}}.to_json)
    @logger.info('sendSingleSms --> ' + response.jsonBody.to_json)
  end

  def analyseSingleSms
    response = @controller.analyseSingleSms({ :body => "A new game has been posted to the MindPuzzle. Check it out", :to => "+306973359355", :from => "amdTelecom"}.to_json)
    @logger.info('analyseSingleSms --> ' + response.jsonBody.to_json)
  end

  def sendCampaign
    response = @controller.sendCampaign({ :body => "A new game has been posted to the MindPuzzle. Check it out", :groups => ["customers"], :from => "amdTelecom", :campaignCallback => { :strategy => "OnCompletion", :url => "http://www.yourserver.com/campaign" }, :smsCallback => {:strategy => "OnChange", :url => "http://www.yourserver.com/message"}}.to_json)
    @logger.info('sendCampaign --> ' + response.jsonBody.to_json)
  end

  def analyseCampaign
    response = @controller.analyseCampaign({ :body => "A new game has been posted to the MindPuzzle. Check it out", :groups => ["customers"], :from => "amdTelecom", :campaignCallback => { :strategy => "OnCompletion", :url => "http://www.yourserver.com/campaign" }, :smsCallback => {:strategy => "OnChange", :url => "http://www.yourserver.com/message"}}.to_json)
    @logger.info('analyseCampaign --> ' + response.jsonBody.to_json)
  end

  def trackSingleSms
    response = @controller.trackSingleSms('44434312-5698-fd78-2378-d4d44a2126c3')
    @logger.info('trackSingleSms --> ' + response.jsonBody.to_json)
  end

  def trackCampaignSms
    response = @controller.trackCampaignSms('44434312-5698-fd78-2378-d4d44a2126c3', nil, nil, nil)
    @logger.info('trackCampaignSms --> ' + response.jsonBody.to_json)
  end

  def trackMultipleSmsWithFilter
    response = @controller.trackMultipleSmsWithFilter([{:fieldName => "id", :searchTerm => "a9122812-21e0-47c1-ba13-746e4a212655"}].to_json, '2015-11-11T15:00Z', '2015-11-11T15:00Z', nil, nil, nil, nil, nil)
    @logger.info('trackMultipleSmsWithFilter --> ' + response.jsonBody.to_json)
  end

  def getSupportedCountriesByLanguage
    response = @controller.getSupportedCountriesByLanguage('en')
    @logger.info('getSupportedCountriesByLanguage --> ' + response.jsonBody.to_json)
  end

  def updateScheduledMessageCampaign
    response = @controller.updateScheduledMessageCampaign('182d20da-1cd1-4d94-b3f5-c2dd38352d22', {:recipients => ["+306984512344"], :senderId => "amdTelecom2", :message => "hellooo my friendd2!!!"}.to_json)
    @logger.info('udpateScheduledMessageCampaign --> ' + response.jsonBody.to_json)
  end

  def deleteScheduledCampaign
    response = @controller.deleteScheduledCampaign('2c96147b-fb5f-4cc2-9cea-374cc68f5408')
    @logger.info('deleteScheduledCampaign --> ' + response.jsonBody.to_json)
  end

  def getCampaignDetails
    response = @controller.getCampaignDetails('2c96147b-fb5f-4cc2-9cea-374cc68f5408')
    @logger.info('getCampaignDetails --> ' + response.jsonBody.to_json)
  end

end