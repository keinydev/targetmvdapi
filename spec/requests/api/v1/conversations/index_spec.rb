require "rails_helper"

describe "GET api/v1/conversations", type: :request do

  let(:user_a) { create(:user) }

  let(:user) { create(:user) }

  let!(:conversation) { create(:conversation, user_a: user_a, user_b: user) }

  subject(:get_conversations) { get api_v1_conversations_path, headers: auth_headers, as: :json }

  describe 'GET Index' do
    context 'when params are valid' do
      before do
        get_conversations
      end
      
      it 'returns a successful response' do
        expect(response).to be_successful
      end

      it 'returns conversations key in body response' do
        expect(json_response['conversations']).to be_present
        expect(json_response.length).to eq(1)
      end      
    end

    context 'when the header is not correct' do
      before do
        auth_headers[:uid] = ""
        get_conversations
      end

      it 'returns an error message' do
        expect(json_response['errors']).to eq(['You need to sign in or sign up before continuing.']) 
      end
    end
  end
end
