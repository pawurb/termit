require 'rubygems'
require 'bundler/setup'
require 'vcr'
require 'webmock/rspec'
require 'coveralls'
Coveralls.wear!
require_relative '../lib/termit'

RSpec.configure do |config|
  original_stderr = $stderr
  original_stdout = $stdout

  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  # redirect output to file
  config.before(:suite) do
    $stderr = File.new(File.join(File.dirname(__FILE__), 'output.txt'), 'w')
    $stdout = File.new(File.join(File.dirname(__FILE__), 'output.txt'), 'w')

  end

  config.after(:suite) do
    $stderr = original_stderr
    $stdout = original_stdout
    system "echo '=======Specs output:======='"
    system "cat spec/output.txt"
    File.delete(File.join(File.dirname(__FILE__), 'output.txt'))
  end


  config.before(:each) do
    stub_request(:get, "https://www.bing.com/translator").with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).to_return(:status => 200, :body => "", :headers => {})

    #for nyan cat formatter
    sleep(0.10)
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = false
end
