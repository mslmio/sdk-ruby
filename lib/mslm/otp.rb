
require_relative '../mslm'
require_relative './constants/constants.rb'

module Mslm
    module Otp
    include Constants

        class SingleVerifyReqOpts
            attr_accessor :disable_url_encode
            attr_accessor :api_key
        end

        class Otp_send_verify

            def send_otp(otp_send_req, opts = nil)

                opt = SingleVerifyReqOpts.new
                opt = opts.last unless opts.nil? || opts.empty?
                qp ={}
                if Mslm.api_key || opt.api_key
                    api_key = opt.api_key || Mslm.api_key
                    qp['apikey'] = api_key
                end

                t_url = Mslm::Constants.prepare_url(Mslm::EmailVerification::BASE_URL + 'api/otp/v1/send', qp, opt)


                otp_send_resp = Mslm::Constants.req_and_resp('POST', t_url, otp_send_req, opt)
                return otp_send_resp
            end

            def verify(otp_token_verify_req, opts = nil)
                opt = SingleVerifyReqOpts.new
                opt = opts.last unless opts.nil? || opts.empty?
                opt.disable_url_encode = true if opt.disable_url_encode.nil?

                qp = {}
                if Mslm.api_key || opt.api_key
                    api_key = opt.api_key || Mslm.api_key
                    qp['apikey'] = api_key
                end

                t_url = Mslm::Constants.prepare_url(Mslm::EmailVerification::BASE_URL + 'api/otp/v1/token_verify', qp, opt)


                otp_token_verify_resp = Mslm::Constants.req_and_resp('POST', t_url, otp_token_verify_req, opt)
                return otp_token_verify_resp
            end
        end
    end
end