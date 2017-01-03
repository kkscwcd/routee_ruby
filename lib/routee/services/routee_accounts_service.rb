require_relative 'routee_service'

class RouteeAccountsService < RouteeService

  def self.getInstance
    @instance ||= RouteeAccountsService.new(nil, 'https://connect.routee.net/accounts')
  end

  def getAccountBalance(token)
    response = RestClient.get(baseUrl + '/me/balance', {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getRouteeServicesPrices(token)
    response = RestClient.get(rootUrl + '/system/prices', {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getAccountTransactions(token)
    response = RestClient.get(baseUrl + '/me/transactions', {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getAvailableBankAccounts(token)
    response = RestClient.get(baseUrl + '/me/banks', {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end
end