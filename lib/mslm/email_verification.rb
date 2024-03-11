
require_relative '../mslm'
require_relative './constants/constants'

module Mslm
  module EmailVerification
  include Constants

    class SingleVerifyReqOpts
        attr_accessor :disable_url_encode
        attr_accessor :api_key
    end
    class SingleVerifyEmail

        def single_verify(email_addr, opts = nil)
            opt = SingleVerifyReqOpts.new
            opt = opts.last unless opts.nil? || opts.empty?
            opt.disable_url_encode = true if opt.disable_url_encode.nil?

            email_addr = URI.encode_www_form_component(email_addr) unless opt.disable_url_encode

            qp = { 'email' => email_addr }
            if Mslm.api_key || opt.api_key
                api_key = opt.api_key || Mslm.api_key
                qp['apikey'] = api_key
            end

            t_url = Mslm::Constants.prepare_url(Mslm::EmailVerification::BASE_URL + 'api/sv/v1', qp, opt)
     

            sv_resp = Mslm::Constants.req_and_resp('GET', t_url, nil, opt)
            return sv_resp
        end
    end
end
end