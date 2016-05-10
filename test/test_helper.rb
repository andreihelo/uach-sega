$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'uach/sega'
require 'minitest/autorun'
require 'vcr'
require 'webmock/minitest'

VCR.configure do |config|
  config.cassette_library_dir = 'test/fixtures/cassettes'
  config.hook_into :webmock
end

def restore_default_config
  ::Uach::Sega.configuration = nil
  ::Uach::Sega.configure {}
end
