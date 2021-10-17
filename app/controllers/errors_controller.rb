class ErrorsController < ApplicationController
  def not_found
    endpoint = Endpoint.find_by(verb: request.method, path: request.path)
    if endpoint
      response = endpoint.response
      set_custom_response_headers(response["headers"])
      render json: response['body'], status: response['code']
    else
      render json: {errors: [{code: "not_found", detail: "Requested page `#{request.path}` does not exist" } ] }.to_json, status: :not_found
    end
  end
end
