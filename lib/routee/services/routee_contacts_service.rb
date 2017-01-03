require_relative 'routee_service'

class RouteeContactsService < RouteeService

  def self.getInstance
    @instance ||= RouteeContactsService.new(nil, 'https://connect.routee.net/contacts')
  end

  def getAllContacts(token, page, size)
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

    response = RestClient.get(baseUrl + '/my' + query, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getContact(token, contactId)
    response = RestClient.get(baseUrl + '/my/' + contactId, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def createContact(token, contact)
    response = RestClient.post(baseUrl + '/my', contact, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def deleteContacts(token, contacts)
    response = RestClientExt.delete(baseUrl + '/my/', contacts, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def deleteContact(token, contactId)
    response = RestClient.delete(baseUrl + '/my/' + contactId, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def updateContact(token, contactId, newContact)
    response = RestClient.put(baseUrl + '/my/' + contactId, newContact, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def checkContact(token, mobile)
    query = ''
    if mobile then
      query = '?value=' + mobile
    end

    response = RestClient.head(baseUrl + '/my/mobile' + query, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def addContactToBlacklist(token, service, contacts)
    response = RestClient.post(baseUrl + '/my/blacklist/' + service, contacts, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getBlacklistedContacts(token, service)
    response = RestClient.get(baseUrl + '/my/blacklist/' + service, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def removeGroupOfContactsFromBlacklist(token, service, groups)
    response = RestClientExt.delete(baseUrl + '/my/blacklist/' + service + '/groups', groups, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def retrieveAccountContactLabels(token)
    response = RestClient.get(baseUrl + '/labels/my', {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def createLabels(token, labels)
    response = RestClient.post(baseUrl + '/labels/my', labels, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getAccountGroups(token)
    response = RestClient.get(rootUrl + '/groups/my', {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getOneOfAccountGroups(token, name)
    response = RestClient.get(rootUrl + '/groups/my/' + name, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getOneOfAccountGroupsInPagedFormat(token, size, page)
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

    response = RestClient.get(rootUrl + '/groups/my/page' + query, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def createGroup(token, group)
    response = RestClient.post(rootUrl + '/groups/my', group, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def deleteGroups(token, groups)
    response = RestClientExt.delete(rootUrl + '/groups/my', groups, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def mergeGroups(token, groups)
    response = RestClient.post(rootUrl + '/groups/my/merge', groups, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def createGroupFromDifference(token, group)
    response = RestClient.post(rootUrl + '/groups/my/difference', group, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def getGroupContacts(token, groupName, size, page, sort)
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

    response = RestClient.get(rootUrl + '/groups/my/' + groupName + '/contacts' + query, {'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def deleteGroupContacts(token, groupName, contacts)
    response = RestClientExt.delete(rootUrl + '/groups/my/' + groupName + '', contacts, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def addContactsToGroup(token, groupName, contacts)
    response = RestClient.post(rootUrl + '/groups/my/' + groupName, contacts, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end

  def removeContactsFromBlacklist(token, service, contacts)
    response = RestClientExt.delete(baseUrl + '/my/blacklist/' + service, contacts, {'content-type': 'application/json', 'authorization': 'Bearer ' + token}){ |response, request, result, &block| response }
    return RouteeRequestResult.new(JSON.parse(response.body), response.code)
  end
end