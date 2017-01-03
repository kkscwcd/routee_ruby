require 'logger'

# Created by Ing. Tatioti Mbogning Raoul(tatiotir@gmail.com, tatioti.raoul@gmail.com)

class ContactsControllerTest

  def initialize(contactsController)
    @controller = contactsController
    @logger = Logger.new(STDOUT)
  end

  def runTests
    createContact()
    deleteContacts()
    getAllContacts()
    getContact()
    updateContact()
    deleteContact()
    addContactToBlacklist()
    getBlacklistedContacts()
    removeGroupOfContactsFromBlacklist()
    retrieveAccountContactLabels()
    createLabels()
    getAccountGroups()
    getOneOfAccountGroups()
    getOneOfAccountGroupsInPagedFormat()
    createGroup()
    deleteGroups()
    mergeGroups()
    createGroupFromDifference()
    getGroupContacts()
    deleteGroupContacts()
    addContactsToGroup()
    removeContactsFromBlacklist()
  end

  def createContact
    response = @controller.createContact({ :firstName => "Nick", :lastName => "Davis", :mobile => "+306984512555", :country => "gr", :vip => false }.to_json)
    @logger.info('createContact --> ' + response.jsonBody.to_json)
  end

  def deleteContacts
    response = @controller.deleteContacts(["5673fd9ce4b03d651b5b640f", "5673fda8e4b03d651b5b6410"].to_json)
    @logger.info('deleteContacts --> ' + response.jsonBody.to_json)
  end

  def getAllContacts
    response = @controller.getAllContacts(nil, nil)
    @logger.info('getAllContacts --> ' + response.jsonBody.to_json)
  end

  def getContact
    response = @controller.getContact('5673fdbde4b03d651b5b6411')
    @logger.info('getContact --> ' + response.jsonBody.to_json)
  end

  def updateContact
    response = @controller.updateContact('5673fdbde4b03d651b5b6411', { :id => "5673fdbde4b03d651b5b6411", :firstName => "James", :lastName => "Davis", :mobile => "+306984512999", :country => "GR", :vip => false, :groups => [ "All", "NotListed" ], :blacklistedServices => [], :labels => [] }.to_json)
    @logger.info('updateContact --> ' + response.jsonBody.to_json)
  end
  
  def deleteContact
    response = @controller.deleteContact('5673fdbde4b03d651b5b6411')
    @logger.info('deleteContact --> ' + response.jsonBody.to_json)
  end

  #def checkContact
    #response = head_helper :checkContact, {value: '+306984512777'}, 'abcd'
    #@logger.info(response.jsonBody.to_json)
  #end

  def addContactToBlacklist
    response = @controller.addContactToBlacklist('Sms', [{ :id => "5674121de4b03d651b5b6414"}].to_json)
    @logger.info('addContactToBlacklist --> ' + response.jsonBody.to_json)
  end

  def getBlacklistedContacts
    response = @controller.getBlacklistedContacts('Sms')
    @logger.info('getBlacklistedContacts --> ' + response.jsonBody.to_json)
  end

  def removeGroupOfContactsFromBlacklist
    response = @controller.removeGroupOfContactsFromBlacklist('5673fdbde4b03d651b5b6411', '[ "testGroup" ]')
    @logger.info('removeGroupOfContactsFromBlacklist --> ' + response.jsonBody.to_json)
  end

  def retrieveAccountContactLabels
    response = @controller.retrieveAccountContactLabels()
    @logger.info('retrieveAccountContactLabels --> ' + response.jsonBody.to_json)
  end

  def createLabels
    response = @controller.createLabels([ { :name => "age", :type => "Number" } ].to_json)
    @logger.info('createLabels --> ' + response.jsonBody.to_json)
  end

  def getAccountGroups
    response = @controller.getAccountGroups()
    @logger.info('getAccountGroups --> ' + response.jsonBody.to_json)
  end

  def getOneOfAccountGroups
    response = @controller.getOneOfAccountGroups('All')
    @logger.info('getOneOfAccountGroups --> ' + response.jsonBody.to_json)
  end

  def getOneOfAccountGroupsInPagedFormat
    response = @controller.getOneOfAccountGroupsInPagedFormat('0', '3')
    @logger.info('getOneOfAccountGroupsInPagedFormat --> ' + response.jsonBody.to_json)
  end

  def createGroup
    response = @controller.createGroup({ :name => "group1" }.to_json)
    @logger.info('createGroup --> ' + response.jsonBody.to_json)
  end

  def deleteGroups
    response = @controller.deleteGroups([ "group1" ].to_json)
    @logger.info('deleteGroups --> ' + response.jsonBody.to_json)
  end

  def mergeGroups
    response = @controller.mergeGroups({ :name => "one-two-three", :groups => [ "one", "two", "three"] }.to_json)
    @logger.info('mergeGroups --> ' + response.jsonBody.to_json)
  end

  def createGroupFromDifference
    response = @controller.createGroupFromDifference({ :name => "one-two-three", :groups => [ "one", "two"] }.to_json)
    @logger.info('createGroupFromDifference --> ' + response.jsonBody.to_json)
  end

  def getGroupContacts
    response = @controller.getGroupContacts('one-two-three', nil, nil, nil)
    @logger.info('getGroupContacts --> ' + response.jsonBody.to_json)
  end

  def deleteGroupContacts
    response = @controller.deleteGroupContacts('customers', [ "5673fdbde4b03d651b5b6411", "5673fdbde4b03d651b5b6412" ].to_json)
    @logger.info('deleteGroupContacts --> ' + response.jsonBody.to_json)
  end

  def addContactsToGroup
    response = @controller.addContactsToGroup('one-two-three', [ "5673fdbde4b03d651b5b6411", "5673fdbde4b03d651b5b6412", "5677d9fde4b03e664ce65432" ].to_json)
    @logger.info('addContactsToGroup --> ' + response.jsonBody.to_json)
  end

  def removeContactsFromBlacklist
    response = @controller.removeContactsFromBlacklist('Sms', [ { :id => "5674121de4b03d651b5b6414"} ].to_json)
    @logger.info('removeContactsFromBlacklist --> ' + response.jsonBody.to_json)
  end
end
