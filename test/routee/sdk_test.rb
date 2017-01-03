require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../../lib/routee/routee'
require_relative 'accounts_controller_test'
require_relative 'contacts_controller_test'
require_relative 'messaging_controller_test'
require_relative 'reports_controller_test'
require_relative 'two_step_verification_controller_test'

MiniTest::Reporters.use!

class SDKTest < Minitest::Test

  def setup
    @routee = Routee.new('57d9191ee4b0464b9119ba64', 'lQYdBRlCob')
  end

  def test_accounts_controller
    AccountsControllerTest.new(@routee.getAccountsController()).runTests()
  end

  def test_contacts_controller
    ContactsControllerTest.new(@routee.getContactsController()).runTests()
  end

  def test_messaging_controller
    MessagingControllerTest.new(@routee.getMessagingController()).runTests()
  end

  def test_reports_controller
    ReportsControllerTest.new(@routee.getReportsController()).runTests()
  end
  def test_two_step_verification_controller
    TwoStepVerificationControllerTest.new(@routee.getTwoStepVerificationController).runTests
  end

end
