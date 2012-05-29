require 'duraflame/message'
require 'duraflame/transcript'

module Duraflame
  class Processor
    def initialize(room, date_range, output_directory, http_client)
      @room = room
      @date_range = date_range
      @output_directory = output_directory
      @http_client = http_client
    end

    def execute
      @date_range.each do |date|
        File.open(@output_directory + "/#{date}-#{@room}.log", 'w') do |file|
          puts "Writing to #{file.path}"

          Transcript.new(@room, date, @http_client).each_message do |message|
            file.puts message.to_s
          end
        end
      end
    end
  end
end
