require 'test_helper'

class Uach::ConfigurationTest < Minitest::Test
  def setup
    restore_default_config
  end

  def test_that_symbolize_key_returns_default_value
    assert_equal false, ::Uach::Sega.configuration.symbolize_keys
  end

  def test_that_given_symbolize_key_value_is_stored
    ::Uach::Sega.configure do |config|
      config.symbolize_keys = true
    end

    assert_equal true, ::Uach::Sega.configuration.symbolize_keys
  end

  def test_that_no_api_token_is_specified
    assert_nil ::Uach::Sega.configuration.api_token
  end

  def test_that_given_api_token_is_stored
    ::Uach::Sega.configure do |config|
      config.api_token = '123FakeToken'
    end

    assert_equal '123FakeToken', ::Uach::Sega.configuration.api_token
  end
end
