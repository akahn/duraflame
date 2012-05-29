module Duraflame
  class UserLookup
    def initialize(http_client)
      @users = {}
      @http_client = http_client
    end

    def [](id)
      @users[id] ||= begin
        @http_client.get("/users/#{id}.json")['user']['name']
      end
    end
  end
end
