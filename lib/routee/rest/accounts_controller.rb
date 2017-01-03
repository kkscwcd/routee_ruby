require_relative 'application_controller'
require_relative '../services/routee_accounts_service'

# Created by Ing. Tatioti Mbogning Raoul(tatiotir@gmail.com, tatioti.raoul@gmail.com)

class AccountsController < ApplicationController

  #api! 'Retrieves the balance of the current account.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getAccountBalance
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeAccountsService.getInstance.getAccountBalance(tokenResult.token)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Retrieves the prices for all Routee services.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getRouteeServicesPrices
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeAccountsService.getInstance.getRouteeServicesPrices(tokenResult.token)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Retrieves the transactions of the current account.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getAccountTransactions
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeAccountsService.getInstance.getAccountTransactions(tokenResult.token)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Retrieve the available bank accounts.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getAvailableBankAccounts
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeAccountsService.getInstance.getAvailableBankAccounts(tokenResult.token)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end
end