require_relative 'helper'
require 'tmpdir'

describe 'Duraflame under integration' do
  before(:all) do
    dir = File.dirname(__FILE__)
    stub_request(:any, /transcript/).to_return(:body => File.open(dir + '/fixtures/transcript.json'))
    stub_request(:any, /users\/1/).to_return(:body => File.open(dir + '/fixtures/user1.json'))
    stub_request(:any, /users\/2/).to_return(:body => File.open(dir + '/fixtures/user2.json'))

    options = {
      :company => 'paperlesspost',
      :token => 'aoeu',
      :room => 4321,
      :output_dir => Dir.tmpdir,
      :start_date => Date.parse('2012-01-01'),
      :end_date => Date.parse('2012-01-01')
    }
    Duraflame.execute(options)

    @log = File.readlines(Dir.tmpdir + "/2012-01-01-#{options[:room]}.log")
  end

  it 'should output three lines' do
    @log.length.should == 4
  end

  it 'should contain Sisko joining' do
    @log[0].should include('0:04 -!- Benjamin Sisko [hostname] has joined')
  end

  it "should contain O'Brien's message joining" do
    @log[1].should include("1:01 < Miles O'Brien> ok")
  end

  it 'should contain Sisko leaving' do
    @log[2].should include('02:20 -!- Benjamin Sisko [hostname] has left')
  end

  it 'should contain the topic changing' do
    @log[3].should match(/04:31 -!- Benjamin Sisko changed the topic .* to: prime directive/)
  end
end
