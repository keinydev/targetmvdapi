require "rails_helper"

describe "POST api/v1/topics", type: :request do
  
  before(:each) do
    load "#{Rails.root}/db/seeds.rb" 
  end

  describe 'GET Index' do
    context 'when the route is valid' do
      before do
        get api_v1_topics_path
      end

      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns data attributes' do
        parsed_response = JSON.parse(response.body) 
        expect(parsed_response[0]['id']).to be_present
        expect(parsed_response[0]['name']).to be_present
        expect(parsed_response[0]['image']).to be_present
      end
    end
  end
end
