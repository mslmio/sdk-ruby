

require 'minitest/autorun'
require_relative '../lib/mslm/otp'

class OtpTest < Minitest::Test
  def setup
    @otp= Mslm::Otp::Otp_send_verify.new

  end

  def test_valid_otp_send
    c = Mslm.init("YOUR_API_KEY")
    expected_response = {
    "code" => 1000,
    "msg"=> "Successfully sent SMS."
    }
    phone_number = "+92334455112"
    otp_send_req = {
      "phone" => phone_number,
      "tmpl_sms" => "Your verification code is {112233}",
      "token_len" => 6,
      "expire_seconds" => 300
    }
    response = @otp.send_otp(otp_send_req)
    assert_equal expected_response, response  
  end

  def test_valid_otp_verification
    phone_number = "+92334455112"
    otp_verify_req = {
      "phone" => phone_number,
      "token" => "123456",  # Replace with actual OTP received
      "consume" => true
    }
    response = @otp.verify(otp_verify_req)
    assert_equal "expected_response", response  
  end

end
