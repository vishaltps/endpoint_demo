class ApplicationController < ActionController::API
  include CommonMethods

  def set_custom_response_headers(headers)
    if headers.count > 1
      headers.each do |key, value|
        response.set_header(key&.to_s, value&.to_s)
      end
    else
      response.set_header(headers&.keys[0]&.to_s, headers&.values[0]&.to_s)
    end
  end
end
