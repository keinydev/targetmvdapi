require "rails_helper"

describe "POST api/v1/users/password", type: :request do

  let(:user) { create(:user) }

  let(:params) do {
    email: user.email,
    redirect_url: "http://localhost:3000/api/v1/reset_passwords"
  }
  end

  subject(:reset_password) { post user_password_path, params: params, as: :json }

  describe 'POST Create' do
    context 'when params are valid' do
      before do
        reset_password
      end

      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the email does not exist' do
      before do
        params[:email] = "notvalid@example.com"
        reset_password
      end

      it 'returns status 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
