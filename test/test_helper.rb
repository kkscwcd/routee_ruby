$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'routee/sdk'
require 'routee/rest/accounts_controller'
require 'routee/rest/contacts_controller'
require 'routee/rest/messaging_controller'
require 'routee/rest/reports_controller'
require 'routee/rest/two_step_verification_controller'
require 'routee/accounts_controller_test'
require 'routee/contacts_controller_test'
require 'routee/messaging_controller_test'
require 'routee/reports_controller_test'
require 'routee/two_step_verification_controller_test'
