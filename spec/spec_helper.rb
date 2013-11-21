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

  #silence test output
  config.before(:all) do
    $stderr = File.new(File.join(File.dirname(__FILE__), 'null.txt'), 'w')
    $stdout = File.new(File.join(File.dirname(__FILE__), 'null.txt'), 'w')
  end

  config.after(:all) do
    $stderr = original_stderr
    $stdout = original_stdout
    File.delete(File.join(File.dirname(__FILE__), 'null.txt'))
  end

  #for nyan cat formatter
  config.before(:each) do
    sleep(0.1)
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/'
  c.hook_into :webmock
end