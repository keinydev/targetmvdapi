require "rails_helper"

describe "POST api/v1/targets", type: :request do

  let(:topic_list) { create_list(:topic, 5) } 
  let(:user) { create(:user) }

  let(:target_params) do {
    target: {
      title: "Meet pop lovers",
      longitude: -75.581215,
      latitude: 6.244203,
      radius: 2,
      topic_id: topic_list.first.id
    }    
  }
  end

  subject(:create_target) { post api_v1_targets_path, params: target_params, headers: auth_headers, as: :json }

  describe 'POST Create' do
    context 'when params are valid' do
      before do
        create_target
      end
      
      it 'returns status 200' do
        expect(response).to be_successful
      end

      it 'returns target key in body response' do
        expect(json_response['target']).to be_present
      end      
    end

    context 'when the header is not correct' do
      before do
        auth_headers[:uid] = ""
        create_target
      end

      it 'returns an error message' do
        expect(json_response['errors']).to eq(['You need to sign in or sign up before continuing.']) 
      end
    end
  end
end
