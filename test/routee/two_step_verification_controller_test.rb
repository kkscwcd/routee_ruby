class TwoStepVerificationControllerTest

  def initialize(twoStepVerificationController)
    @controller = twoStepVerificationController
    @logger = Logger.new(STDOUT)
  end

  def runTests
    init2StepVerification()
    get2StepVerificationStatus()
    cancel2StepVerification()
    confirm2StepVerification()
    retrieve2StepAccountReports()
    retrieve2StepApplicationReports()
  end

  def init2StepVerification
    response = @controller.init2StepVerification({ :method => "sms", :type => "code", :recipient => "+306909000000" }.to_json)
    @logger.info('init2StepVerification --> ' + response.jsonBody.to_json)
  end

  def get2StepVerificationStatus
    response = @controller.get2StepVerificationStatus('a5c3dd60-8122-45ff-8d81-1019489e5fd4')
    @logger.info('get2StepVerificationStatus --> ' + response.jsonBody.to_json)
  end

  def cancel2StepVerification
    response = @controller.cancel2StepVerification('a5c3dd60-8122-45ff-8d81-1019489e5fd4')
    @logger.info('cancel2StepVerification --> ' + response.jsonBody.to_json)
  end

  def confirm2StepVerification
    response = @controller.confirm2StepVerification('a5c3dd60-8122-45ff-8d81-1019489e5fd4', 'answer=1343')
    @logger.info('confirm2StepVerification --> ' + response.jsonBody.to_json)
  end

  def retrieve2StepAccountReports
    response = @controller.retrieve2StepAccountReports()
    @logger.info('retrieve2StepAccountReports --> ' + response.jsonBody.to_json)
  end

  def retrieve2StepApplicationReports
    response = @controller.retrieve2StepApplicationReports('2c96147b-fb5f-4cc2-9cea-374cc68f5408')
    @logger.info('retrieve2StepApplicationReports --> ' + response.jsonBody.to_json)
  end

end