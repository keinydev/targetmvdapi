require "rails_helper"

describe "PUT api/v1/users/password", type: :request do

  let(:user) { create(:user) }

  let(:params) do {
    password: 'my_new_password',
    password_confirmation: 'my_new_password'
  }
  end

  subject(:reset_password) { put user_password_path, params: params, headers: auth_headers, as: :json }

  describe 'PUT Update' do
    context 'when params are valid' do
      before do
        reset_password
      end

      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the password confirmation does not match' do
      before do
        params[:password_confirmation] = "different_password"
        reset_password
      end

      it 'returns status 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
