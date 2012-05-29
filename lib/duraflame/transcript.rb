module Duraflame
  class Transcript
    def initialize(room, date, http_client)
      @room = room
      @date = date
      @http_client = http_client
    end

    def each_message
      @http_client.get(url)['messages'].each do |message|
        if Duraflame.const_defined?(message['type']) # e.g. TextMessage
          message_class = Duraflame.const_get(message['type'])
          args = message.values_at('created_at', 'user_id', 'body')
          yield message_class.new(*args)
        end
      end
    end

    private

    def url
      "/room/%s/transcript/%s/%s/%s.json" %
        [@room, @date.year, @date.month, @date.day]
    end
  end
end
