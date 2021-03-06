require "rails_helper"

describe "GET api/v1/topics", type: :request do

  describe 'GET Index' do
    context 'when the route is valid' do
      before do
        create_list(:topic, 5)
        get api_v1_topics_path
      end

      it 'returns status 200' do
        expect(response).to be_successful
      end

      it 'returns first data row attributes' do
        expect(json_response[0]['id']).to be_present
        expect(json_response[0]['name']).to be_present
        expect(json_response[0]['image']).to be_present
      end

      it "returns the total data generated" do
        expect(json_response.length).to eq(5)
      end
    end
  end
end
