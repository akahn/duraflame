Gem::Specification.new do |s|
  s.name              = 'duraflame'
  s.version           = '0.2.0'
  s.date              = '2012-06-29'

  s.summary     = "A command line tool that converts Campfire transcripts to an IRC log format"
  s.description = "Generate pisg (Perl IRC Statistics Generator) stats on Campfire conversations"

  s.authors  = ["Alex Kahn"]
  s.email    = 'alexanderkahn@gmail.com'
  s.homepage = 'http://github.com/akahn/duraflame'

  s.require_paths = %w[lib]

  s.executables = ["duraflame"]

  s.extra_rdoc_files = %w[README.md MIT-LICENSE]

  s.add_dependency('httpclient', '~>2.6')
  s.add_dependency('yajl-ruby', '~>1.1')

  # = MANIFEST =
  s.files = %w[
    Gemfile
    Gemfile.lock
    MIT-LICENSE
    README.md
    Rakefile
    bin/duraflame
    duraflame.gemspec
    lib/duraflame.rb
    lib/duraflame/client.rb
    lib/duraflame/message.rb
    lib/duraflame/processor.rb
    lib/duraflame/transcript.rb
    lib/duraflame/translator.rb
    lib/duraflame/user_lookup.rb
    spec/fixtures/transcript.json
    spec/fixtures/user1.json
    spec/fixtures/user2.json
    spec/helper.rb
    spec/integration_spec.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^spec\/.*_spec\.rb/ }
end
