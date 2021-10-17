require 'rails_helper'

RSpec.describe Api::EndpointsController, type: :request do
  describe 'POST create' do
    it 'should create the endpoint' do
      post '/api/v1/endpoints', as: :json, params: { endpoint: { verb: 'get', path: '/hello', response: { code: 200 } } }

      expect(response).to have_http_status :created
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.dig('data', 'attributes', 'verb')).to eq 'GET'
      expect(parsed_response.dig('data', 'attributes', 'path')).to eq '/hello'
      expect(parsed_response.dig('data', 'attributes', 'response', 'code')).to eq 200
    end
  end

  describe 'GET index' do
    let!(:endpoint) { create(:endpoint, path: '/hello', verb: 'post') }

    it 'should list all the endpoints' do
      get '/api/v1/endpoints', as: :json
      expect(response).to have_http_status :ok
      parsed_response = JSON.parse(response.body)
      
      expect(parsed_response['data'].count).to eq 1
      expect(parsed_response.dig('data', 0, 'attributes', 'verb')).to eq 'POST'
      expect(parsed_response.dig('data', 0, 'attributes', 'path')).to eq '/hello'
    end
  end

  describe 'PATCH update' do
    let!(:endpoint) { create(:endpoint, path: '/hello', verb: 'post') }

    it 'should update the given endpoint' do
      patch "/api/v1/endpoints/#{endpoint.id}", as: :json, params: { endpoint: { verb: 'get' } }
      expect(response).to have_http_status :ok
      parsed_response = JSON.parse(response.body)

      expect(parsed_response.dig('data', 'attributes', 'verb')).to eq 'GET'
    end
  end

  describe 'GET show' do
    let!(:endpoint) { create(:endpoint, path: '/greetings', verb: 'post') }

    it 'should give details of the given endpoint' do
      get "/api/v1/endpoints/#{endpoint.id}", as: :json
      expect(response).to have_http_status :ok
      parsed_response = JSON.parse(response.body)

      expect(parsed_response.dig('data', 'attributes', 'verb')).to eq 'POST'
      expect(parsed_response.dig('data', 'attributes', 'path')).to eq '/greetings'
    end
  end

  describe 'DELETE destroy' do
    let!(:endpoint) { create(:endpoint, path: '/greetings', verb: 'post') }

    it 'should give details of the given endpoint' do
      expect { delete "/api/v1/endpoints/#{endpoint.id}" }.to change(Endpoint, :count).by(-1)
    end
  end
end