require "rails_helper"

describe "POST api/v1/users/sign_in", type: :request do

  let(:user) { create(:user) }
  
  let(:params) do {
    user: {
      email: user.email,
      password: user.password
    }    
  }
  end

  subject(:signin) { post new_user_session_path, params: params, as: :json }

  describe 'POST Create' do

    context 'when user has not confirmed the account' do
      before do
        signin
      end

      it 'returns unathorized status 401' do
        expect(response).to have_http_status(401)
      end  

      it 'returns error message' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['errors'].first).to match('A confirmation email was sent to your account at')
      end
    end

    context 'when login params are valid' do
      before do
        user.confirm
        signin
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

    context 'when login params are invalid' do
      before do
        user.confirm
        params[:user][:password] = "password_not_valid"
        signin
      end

      it 'returns unathorized status 401' do
        expect(response).to have_http_status(401)
      end  

      it 'returns error message' do
        expect(json_response['errors']).to eq(['Invalid login credentials. Please try again.']) 
      end
    end
  end
end
