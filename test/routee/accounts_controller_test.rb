#require_relative '../../lib/routee/rest/accounts_controller'
require 'logger'
#require 'minitest/autorun'
#require 'minitest/reporters'
#MiniTest::Reporters.use!

# Created by Ing. Tatioti Mbogning Raoul(tatiotir@gmail.com, tatioti.raoul@gmail.com)

class AccountsControllerTest

  def initialize(accountsController)
    @controller = accountsController
    @logger = Logger.new(STDOUT)
  end

  def getAccountBalance
    response = @controller.getAccountBalance
    @logger.info('getAccountBalance --> ' + response.jsonBody.to_json)
  end

  def getRouteeServicesPrices
    response = @controller.getRouteeServicesPrices
    @logger.info('getRouteeServicesPrices --> ' + response.jsonBody.to_json)
  end

  def getAccountTransactions
    response = @controller.getAccountTransactions
    @logger.info('getAccountTransactions --> ' + response.jsonBody.to_json)
  end

  def getAvailableBankAccounts
    response = @controller.getAvailableBankAccounts
    @logger.info('getAvailableBankAccounts --> ' + response.jsonBody.to_json)
  end

  def runTests
    getAccountBalance()
    getRouteeServicesPrices()
    getAccountTransactions()
    getAvailableBankAccounts()
  end
end