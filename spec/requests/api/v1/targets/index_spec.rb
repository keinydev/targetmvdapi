require "rails_helper"

describe "GET api/v1/targets", type: :request do

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

  before do
    post api_v1_targets_path, params: target_params, headers: auth_headers, as: :json
  end 

  subject(:get_target) { get api_v1_targets_path, headers: auth_headers }

  describe 'GET Index' do
    context 'when params are valid' do
      before do
        get_target
      end
      
      it 'returns status 200' do
        expect(response).to be_successful
      end

      it 'returns targets' do
        expect(json_response).not_to be_empty
      end      
    end

    context 'when the header is not correct' do
      before do
        auth_headers[:uid] = ""
        get_target
      end

      it 'returns an error message' do
        expect(json_response['errors']).to eq(['You need to sign in or sign up before continuing.']) 
      end
    end
  end
end
