
require 'uri'
require 'net/http'
require 'json'

module Mslm
  module Constants
    BASE_URL = 'https://mslm.io/'.freeze

    def self.prepare_url(path, query_params, opts)
      url = path.dup
      url << '?' << URI.encode_www_form(query_params) unless query_params.empty?
      url
    end

    def self.req_and_resp(_method, _url, _data, _opts)
      uri = URI.parse(_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.scheme == 'https'

      if _method == 'POST'
        request = Net::HTTP::Post.new(uri.request_uri)
        request.body = _data.to_json
        request.content_type = 'application/json'
      elsif _method == 'GET'
        request = Net::HTTP::Get.new(uri.request_uri)
        
      else
        return "Unsupported HTTP method: #{_method}"
      end

      response_data = http.request(request)

      if _method == 'POST' and response_data.code.to_i == 200
        json_response = JSON.parse(response_data.body)
        return json_response

      elsif response_data.code.to_i == 200
        json_response = JSON.parse(response_data.body)
        response = [json_response["email"],json_response["username"],json_response["domain"],json_response["malformed"],json_response["suggestion"],json_response["status"],json_response["has_mailbox"],json_response["accept_all"],json_response["disposable"],json_response["free"],json_response["role"],json_response['mx']]
       
        return response 
      else
        return "HTTP #{response_data.code}: #{response_data.message}"
      end
    end
  end
end