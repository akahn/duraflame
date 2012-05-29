require 'duraflame/processor'
require 'duraflame/user_lookup'
require 'duraflame/client'

module Duraflame
  VERSION = '0.1.0'

  extend self

  def execute(options)
    %w[company token output_dir room].each do |option|
      if !options.has_key?(option.to_sym)
        abort "Error: Missing option --#{option}. See duraflame --help."
      end
      instance_variable_set('@' + option, options[option.to_sym])
    end

    start_date = options.fetch(:start_date, Date.today)
    end_date = options.fetch(:end_date, Date.today)
    Processor.new(@room, start_date..end_date, @output_dir, http_client).execute
  end

  def http_client
    @http_client ||= Client.new(@company, @token)
  end

  def user_names
    @user_lookup ||= UserLookup.new(http_client)
  end
end
