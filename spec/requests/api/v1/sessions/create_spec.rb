require "rails_helper"

RSpec.describe "POST api/v1/users/sign_in", type: :request do
  before(:each) do
    @user = FactoryBot.create(:user) 
    @sign_in_url = '/api/v1/users/sign_in' 
    @sign_in_params = {
      user: {
        email: @user.email,
        password: @user.password
      }
    }
  end

  describe 'POST Create' do
    context 'when login params is valid' do
      before do
        post @sign_in_url, params: @sign_in_params, as: :json
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
        @sign_in_params[:user][:password] = "password_not_valid"
        post @sign_in_url, params: @sign_in_params, as: :json
      end
      it 'returns unathorized status 401' do
        expect(response).to have_http_status(401)
      end      
      it 'returns error message' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['errors']).to eq(['Invalid login credentials. Please try again.']) 
      end
    end
  end
end
