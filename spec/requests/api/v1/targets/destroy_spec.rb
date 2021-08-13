require "rails_helper"

describe "DELETE api/v1/targets/:id", type: :request do

  let(:topic_list) { create_list(:topic, 5) } 

  let(:user) { create(:user) }

  let(:target) { create(:target, user: user, topic: topic_list.first) }

  subject(:delete_target) { delete api_v1_target_path(target.id), headers: auth_headers, as: :json }

  describe 'DELETE Destroy' do
    context 'when params are valid' do
      it 'returns status 204' do
        delete_target
        expect(response).to be_successful
      end
      
      it 'destroys a target in the database' do
        expect do
          delete_target
        end.to change(Target, :count).by(0)
      end
    end

    context 'when the header is not correct' do
      before do
        auth_headers[:uid] = ""
        delete_target
      end

      it 'returns an error message' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['errors']).to eq(['You need to sign in or sign up before continuing.']) 
      end
    end
  end
end
