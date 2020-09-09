# spec/controllers/registrations_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::ListController do

  describe 'Get doctors List' do
    it 'returns http success' do
      get :doctors, format: :json
      expect(response.status).to eql(200)
    end
  end

  describe 'Get Hospital List' do
    it 'returns http success' do
      get :hospitals, format: :json
      expect(response.status).to eql(200)
    end
  end

  describe 'Get Booking List' do
    it 'returns http success' do
      get :index, format: :json
      expect(response.status).to eql(200)
    end
  end
end
