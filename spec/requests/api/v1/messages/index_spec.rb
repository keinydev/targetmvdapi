require "rails_helper"

describe "GET api/v1/conversations/:conversation_id/messages", type: :request do

  let(:user_a) { create(:user) }

  let(:user) { create(:user) }

  let(:conversation) { create(:conversation, user_a: user_a, user_b: user) }

  let!(:message_list) { create_list(:message, 100, user: user, conversation: conversation) } 

  subject(:get_messages) { get api_v1_conversation_messages_path(conversation.id), params: { page: 2 }, headers: auth_headers }

  context 'when params are valid' do
    before do
      get_messages
    end
    
    it 'returns a successful response' do
      expect(response).to be_successful
    end 
    
    it 'returns the pagination data' do
      expect(json_response['items']).not_to be_nil
      expect(json_response['pages']).not_to be_nil
      expect(json_response['total']).to eq(100)
    end

    it 'returns the paginated messages' do
      expect(json_response['messages'].count).to eq(50)
    end
  end

  context 'when the header is not correct' do
    before do
      auth_headers[:uid] = ""
      get_messages
    end

    it 'returns an error message' do
      expect(json_response['errors']).to eq(['You need to sign in or sign up before continuing.']) 
    end
  end
end
