
# email_verification_test.rb

require 'minitest/autorun'
require_relative '../lib/mslm/email_verification'

class EmailVerificationTest < Minitest::Test
  def setup
    @verifier = Mslm::EmailVerification::SingleVerifyEmail.new
  end

  def test_valid_email_verification
    expected_result = []
    c = Mslm.init("YOUR_API_KEY")
    response = @verifier.single_verify("email@example.com")
    assert_equal expected_result, response  
  end

end
