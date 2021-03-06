require "rails_helper"

describe "POST api/v1/users", type: :request do

  let(:params) do {
    user: {
      email: 'user@example.com',
      gender: 'male',
      password: '12345678',
      password_confirmation: '12345678'
    },
    confirm_success_url: '/'
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
    end

    context 'when the email is not correct' do
      before do
        params[:user][:email] = "is_not_valid"
        signup
      end

      it 'does not create a user' do
        expect(json_response['errors']['email']).to eq(['is not an email']) 
      end
    end
  end
end
