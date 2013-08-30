require 'rubygems'
require 'bundler/setup'
require 'vcr'
require 'webmock/rspec'

require_relative '../lib/termit'

RSpec.configure do |config|
  # some (optional) config here
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/'
  c.hook_into :webmock
end