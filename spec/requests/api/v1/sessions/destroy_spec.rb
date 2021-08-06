require "rails_helper"

describe "DELETE api/v1/users/sign_out", type: :request do

  let(:user) { create(:user) }

  subject(:signout) { delete destroy_user_session_path, headers: auth_headers }

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
        auth_headers[:uid] = ""
        signout
      end

      it 'returns an error message' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['errors']).to eq(['User was not found or was not logged in.']) 
      end
    end
  end
end
