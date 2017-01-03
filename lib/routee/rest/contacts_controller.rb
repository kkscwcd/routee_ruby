require_relative 'application_controller'
require_relative '../services/routee_contacts_service'

# Created by Ing. Tatioti Mbogning Raoul(tatiotir@gmail.com, tatioti.raoul@gmail.com)

class ContactsController < ApplicationController

  #api! 'Create a new contact or update it if it already exists.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def createContact(contact)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.createContact(tokenResult.token, contact)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Delete multiple contacts that exist in the specified account.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def deleteContacts(contact)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.deleteContacts(tokenResult.token, contact)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Retrieve all the contacts of this account and sub-accounts in paged format.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getAllContacts(page, size)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.getAllContacts(tokenResult.token, page, size)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Get the details of a specific contact providing the contact’s id.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getContact(id)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.getContact(tokenResult.token, id)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Change the details of a specific contact providing the contact’s id.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def updateContact(id, newContact)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.updateContact(tokenResult.token, id, newContact)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Delete an already existing contact providing the contact’s id.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def deleteContact(id)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.deleteContact(tokenResult.token, id)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Determines whether a contact with the provided mobile exists.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def checkContact(mobile)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.checkContact(tokenResult.token, mobile)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Adds contacts to the opt-outed contacts of the given service.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def addContactToBlacklist(service, contacts)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.addContactToBlacklist(tokenResult.token, service, contacts)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Returns all the opt-outed contacts for the given service.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getBlacklistedContacts(service)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.getBlacklistedContacts(tokenResult.token, service)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Remove contacts by groups from the opt-outed contacts of the given service.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def removeGroupOfContactsFromBlacklist(service, groups)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.removeGroupOfContactsFromBlacklist(tokenResult.token, service, groups)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Returns all contact labels that this account has defined (both default and custom).'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def retrieveAccountContactLabels
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.retrieveAccountContactLabels(tokenResult.token)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Creates contact labels for this account.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def createLabels(labels)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.createLabels(tokenResult.token, labels)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Returns all the groups that the account has created.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getAccountGroups
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.getAccountGroups(tokenResult.token)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Returns one of the groups that the account has created.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getOneOfAccountGroups(name)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.getOneOfAccountGroups(tokenResult.token, name)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Returns a page of the groups that the account has created.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getOneOfAccountGroupsInPagedFormat(size, page)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.getOneOfAccountGroupsInPagedFormat(tokenResult.token, size, page)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Creates a new group.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def createGroup(group)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.createGroup(tokenResult.token, group)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Deletes an array of groups.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def deleteGroups(groups)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.deleteGroups(tokenResult.token, groups)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Creates a new group created from the merge operation applied on the provided groups.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def mergeGroups(groups)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.mergeGroups(tokenResult.token, groups)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Creates a new group created from the difference operation applied on the provided groups.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def createGroupFromDifference(group)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.createGroupFromDifference(tokenResult.token, group)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Returns all contacts of the provided "tag".'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def getGroupContacts(groupName, size, page, sort)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.getGroupContacts(tokenResult.token, groupName, size, page, sort)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Deletes the contacts that match the provided ids from the specified group'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def deleteGroupContacts(groupName, contacts)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.deleteGroupContacts(tokenResult.token, groupName, contacts)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Add existing contacts to an existing group.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def addContactsToGroup(groupName, contacts)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.addContactsToGroup(tokenResult.token, groupName, contacts)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Removes contacts from the opt-outed contacts of the given service.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def removeContactsFromBlacklist(service, contacts)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeContactsService.getInstance.removeContactsFromBlacklist(tokenResult.token, service, contacts)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end
end
