require "rails_helper"

describe "POST api/v1/conversations/:conversation_id/messages", type: :request do

  let(:user_a) { create(:user) }

  let(:user) { create(:user) }

  let!(:conversation_a) { create(:conversation, user_a: user_a, user_b: user) }

  let(:message_params) do {
    message: {
      body: "Hi!"
    }    
  }
  end

  subject(:create_message) { post api_v1_conversation_messages_path(conversation_a.id), params: message_params, headers: auth_headers, as: :json }

  context 'when params are valid' do
    before do
      create_message
    end
    
    it 'returns a successful response' do
      expect(response).to be_successful
    end  

    it 'create a message in the database' do
      expect(Message.count).to eq(1)
    end       
  end

  context 'when the header is not correct' do
    before do
      auth_headers[:uid] = ""
      create_message
    end

    it 'returns an error message' do
      expect(json_response['errors']).to eq(['You need to sign in or sign up before continuing.']) 
    end
  end
end
