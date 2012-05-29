module Duraflame
  # Converts a timestamp, user_id and possible body into irssi log format
  class Message
    def initialize(timestamp, user_id, body)
      @timestamp = timestamp
      @user_id = user_id
      @body = body
    end

    private

    def name
      Duraflame.user_names[@user_id]
    end

    def time
      Time.parse(@timestamp).strftime('%R')
    end

    attr_reader :body
  end

  class TextMessage < Message
    def to_s
      [time, "< #{name}>", body].join(' ')
    end
  end

  class EnterMessage < Message
    def to_s
      [time, '-!-' , name, '[hostname] has joined #campfire'].join(' ')
    end
  end

  class KickMessage < Message
    def to_s
      [time, '-!-' , name, '[hostname] has left #campfire'].join(' ')
    end
  end
end
