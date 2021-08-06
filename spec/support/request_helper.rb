module Request
  module Helpers
    def auth_headers
      @auth_headers ||= user.create_new_auth_token
    end
  end
end
