require_relative 'rest/accounts_controller'
require_relative 'rest/contacts_controller'
require_relative 'rest/messaging_controller'
require_relative 'rest/reports_controller'
require_relative 'rest/two_step_verification_controller'

class Routee

  @@token = ''
  @@appSecret = ''
  @@appId = ''

  def initialize(appId, appSecret)
    @@appId, @@appSecret = appId, appSecret
  end

  def getContactsController
    @contactsController ||= ContactsController.new()
  end

  def getAccountsController
    @accountsController ||= AccountsController.new()
  end

  def getMessagingController
    @messagingController ||= MessagingController.new()
  end

  def getReportsController
    @reportsController ||= ReportsController.new()
  end

  def getTwoStepVerificationController
    @twoStepVerificationController ||= TwoStepVerificationController.new()
  end

  def self.updateToken=newToken
    @@token = newToken
  end

  def self.token
    @@token
  end

  def self.appId
    @@appId
  end

  def self.appId=appId
    @@appId = appId
  end

  def self.appSecret
    @@appSecret
  end

  def self.appSecret=appSecret
    @@appSecret = appSecret
  end
end