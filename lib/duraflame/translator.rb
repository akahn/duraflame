module Duraflame
  module Translator
    extend self

    def text_message(message)
      date, user, body = message.values_at('created_at', 'user_id', 'body')
      time = date.split(' ')[1].split(':')[0..1].join(':')
      "#{time} <#{user}> #{body}"
    end

    def enter_message(message)
      time = message['created_at'].split(' ')[1].split(':')[0..1].join(':')
      "#{time} <#{message['user_id']}> has joined"
    end

    def kick_message(message)
      time = message['created_at'].split(' ')[1].split(':')[0..1].join(':')
      "#{time} <#{message['user_id']}> has left"
    end

    def upload_message(*)
    end

    def sound_message(*)
    end

    def tweet_message(*)
    end

    def paste_message(*)
    end

    def timestamp_message(*)
    end
  end
end
