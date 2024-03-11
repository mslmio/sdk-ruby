
require_relative "mslm/email_verification"
require_relative "mslm/otp"
require_relative "mslm/version"

module Mslm
  class << self
    attr_accessor :api_key

    def init(api_key = nil)
      @api_key = api_key
    end
  end
end