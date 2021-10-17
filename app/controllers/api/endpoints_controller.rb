# frozen_string_literal: true

module Api
  class EndpointsController < ApplicationController
    before_action :endpoint, except: %i[index create]

    def index
      render json: Api::EndpointSerializer.new(Endpoint.all), status: 200
    end

    def create
      endpoint = Endpoint.create!(endpoint_params)
      render json: Api::EndpointSerializer.new(endpoint), status: 201
    end

    def show
      render json: Api::EndpointSerializer.new(endpoint), status: 200
    end

    def update
      endpoint.update!(endpoint_params)
      render json: Api::EndpointSerializer.new(endpoint), status: 200
    end

    def destroy
      endpoint.destroy!
      render json: {}, status: 200
    end

    private

    def endpoint_params
      params.require(:endpoint).permit(:verb, :path, response: {})
    end

    def endpoint
      @endpoint ||= Endpoint.find(params[:id])
    end
  end
end
