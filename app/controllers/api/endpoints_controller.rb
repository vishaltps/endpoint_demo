# frozen_string_literal: true

module Api
  class EndpointsController < ApplicationController
    before_action :endpoint, except: %i[index create]

    def index
      render json: Api::EndpointSerializer.new(Endpoint.all), status: 200
      # render_success_response(Api::EndpointSerializer.new(Endpoint.all))
    end

    def create
      endpoint = Endpoint.create!(endpoint_params)
      # render_success_response(Api::EndpointSerializer.new(endpoint), 'Endpoint added successfully', 201)
      render json: Api::EndpointSerializer.new(endpoint), status: 201
    end

    def show
      render json: Api::EndpointSerializer.new(endpoint), status: 200
      # render_success_response(Api::EndpointSerializer.new(endpoint))
    end

    def update
      endpoint.update!(endpoint_params)
      render json: Api::EndpointSerializer.new(endpoint), status: 200
      # render_success_response(Api::EndpointSerializer.new(endpoint), 'Endpoint updated successfully')
    end

    def destroy
      endpoint.destroy!
      render json: {}, status: 200
      # render_success_response(Api::EndpointSerializer.new(endpoint), 'Endpoint deleted successfully')
    end

    private

    def endpoint_params
      # params.require(:endpoint).permit(:verb, :path, response: [:code, :headers, :body])
      params.require(:endpoint).permit(:verb, :path, response: {})
    end

    def endpoint
      @endpoint ||= Endpoint.find(params[:id])
    end
  end
end
