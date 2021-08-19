require "rails_helper"

describe "GET api/v1/conversations", type: :request do

  let(:topic) { create(:topic) } 

  let(:user_a) { create(:user) }

  let!(:target_1) { create(:target, user: user_a, topic: topic, longitude: 114.2219923, latitude: 22.3129115, radius: 5) }

  let(:user) { create(:user) }

  let(:target_params) do {
    target: {
      title: "Meet pop lovers",
      longitude: 114.2219993,
      latitude: 22.3129125,
      radius: 5,
      topic_id: topic.id
    }    
  }
  end

  before do
    post api_v1_targets_path, params: target_params, headers: auth_headers, as: :json 
  end

  subject(:get_conversations) { get api_v1_conversations_path, headers: auth_headers, as: :json }

  describe 'GET Index' do
    context 'when params are valid' do
      before do
        get_conversations
      end
      
      it 'returns status 200' do
        expect(response).to be_successful
      end

      it 'returns conversations key in body response' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['conversations']).to be_present
        expect(parsed_response.length).to eq(1)
      end      
    end

    context 'when the header is not correct' do
      before do
        auth_headers[:uid] = ""
        get_conversations
      end

      it 'returns an error message' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['errors']).to eq(['You need to sign in or sign up before continuing.']) 
      end
    end
  end
end
