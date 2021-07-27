require "rails_helper"

RSpec.describe "POST api/v1/users", type: :request do

  let(:params) do {
    user: {
      email: 'user@example.com',
      gender: 'male',
      password: '12345678',
      password_confirmation: '12345678'
    }   
  }
  end

  subject(:signup) { post user_registration_path, params: params, as: :json }

  describe 'POST Create' do
    context 'when signup params are valid' do
      before do
        signup
      end

      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns authentication header with right attributes' do
        expect(response.headers['access-token']).to be_present
      end

      it 'returns client in authentication header' do
        expect(response.headers['client']).to be_present
      end

      it 'returns expiry in authentication header' do
        expect(response.headers['expiry']).to be_present
      end

      it 'returns uid in authentication header' do
        expect(response.headers['uid']).to be_present
      end
    end

    context 'when the email is not correct' do
      before do
        params[:user][:email] = "is_not_valid"
        signup
      end

      it 'does not create a user' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['errors']['email']).to eq(['is not an email']) 
      end
    end
  end
end
