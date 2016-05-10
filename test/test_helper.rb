$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'uach/sega'

require 'minitest/autorun'

def restore_default_config
  ::Uach::Sega.configuration = nil
  ::Uach::Sega.configure {}
end
