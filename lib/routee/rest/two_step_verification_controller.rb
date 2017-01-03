require_relative 'application_controller'
require_relative '../services/routee_two_step_verification_service'

# Created by Ing. Tatioti Mbogning Raoul(tatiotir@gmail.com, tatioti.raoul@gmail.com)

class TwoStepVerificationController < ApplicationController

  #api! 'Initiate a new 2step verification'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def init2StepVerification(verificationData)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeTwoStepVerificationService.getInstance.init2StepVerification(tokenResult.token, verificationData)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Retrieve the status of a 2step verification'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def get2StepVerificationStatus(trackingId)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeTwoStepVerificationService.getInstance.get2StepVerificationStatus(tokenResult.token, trackingId)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Cancel a Pending 2step verification'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def cancel2StepVerification(trackingId)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeTwoStepVerificationService.getInstance.cancel2StepVerification(tokenResult.token, trackingId)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Confirm a 2step verification by providing an answer.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def confirm2StepVerification(trackingId, bodyData)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeTwoStepVerificationService.getInstance.confirm2StepVerification(tokenResult.token, trackingId, bodyData)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Retrieve the report from all two step applications of your account.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def retrieve2StepAccountReports
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeTwoStepVerificationService.getInstance.retrieve2StepAccountReports(tokenResult.token)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end

  #api! 'Retrieve the report for a specific application.'
  #header 'SDK-Secret', 'Your secret key.', {:required => true}
  def retrieve2StepApplicationReports(appId)
    tokenResult = authenticate()
    if tokenResult.token then
      result = RouteeTwoStepVerificationService.getInstance.retrieve2StepApplicationReports(tokenResult.token, appId)
      return result
    else
      return RouteeRequestResult.new(tokenResult.error, tokenResult.statusCode)
    end
  end
end