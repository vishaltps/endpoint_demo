require 'rails_helper'

RSpec.describe :endpoint, type: :model do
  describe 'validations' do
    it 'validates verb' do
      expect(build(:endpoint, verb: '')).not_to be_valid
      expect(build(:endpoint, verb: 'test')).not_to be_valid
      expect(build(:endpoint, verb: 'get')).to be_valid
    end

    it 'validates path' do
      expect(build(:endpoint, path: '')).not_to be_valid
      create(:endpoint, path: '/test')
      expect(build(:endpoint, path: '/test')).not_to be_valid
    end

    it 'validates response' do
      expect(build(:endpoint, response: '')).not_to be_valid
      expect(build(:endpoint, response: { code: 200 })).to be_valid
    end
  end

  describe '.upcase' do
    it 'should transform verb value to upper case' do
      endpoint = create(:endpoint, verb: 'get')
      expect(endpoint.verb).to eq 'GET'
    end
  end

  describe '.response_schema_valid?' do
    it 'should raise error when the schema is incorrect for response' do
      endpoint = build(:endpoint, response: { code: '200'} )
      expect(endpoint.response_schema_valid?).to eq false
    end

    it 'should return true when the schema is valid' do
      endpoint = build(:endpoint, response: { code: 200 } )
      expect(endpoint.response_schema_valid?).to eq true
    end
  end
end