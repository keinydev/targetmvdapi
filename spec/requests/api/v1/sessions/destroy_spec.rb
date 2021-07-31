require "rails_helper"

describe "DELETE api/v1/users/sign_out", type: :request do

  let(:user) { create(:user) }
  
  let(:params) do {
    user: {
      email: user.email,
      password: user.password
    }    
  }
  end

  before do
    user.confirm
    post new_user_session_path, params: params, as: :json
  end
 
  let(:headers) do {
    'uid': response.headers['uid'],
    'client': response.headers['client'],
    'access-token': response.headers['access-token']
  }
  end

  subject(:signout) { delete destroy_user_session_path, headers: headers }

  describe 'DELETE Destroy' do
    context 'when logout params are valid' do
      before do
        signout
      end

      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the header is not correct' do
      before do
        headers[:uid] = ""
        signout
      end

      it 'returns an error message' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['errors']).to eq(['User was not found or was not logged in.']) 
      end
    end
  end
end
