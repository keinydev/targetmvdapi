module Request
  module Helpers
    def auth_headers
      @auth_headers ||= user.create_new_auth_token
    end

    def json_response
      JSON.parse(response.body).with_indifferent_access
    end
  end
end
