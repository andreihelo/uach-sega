require 'test_helper'

class Uach::SegaTest < Minitest::Test
  FAKE_API_TOKEN = '123FakeToken'
  
  def setup
    ::Uach::Sega.configuration.symbolize_keys = true
    @client = ::Uach::Sega::Client.new(FAKE_API_TOKEN)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Uach::Sega::VERSION
  end

  def test_that_it_has_a_base_uri
    refute_nil ::Uach::Sega::Client.base_uri
    assert_equal 'http://servicios.uach.mx', ::Uach::Sega::Client.base_uri
  end

  def test_that_it_has_an_api_token
    assert_equal FAKE_API_TOKEN, @client.api_token
  end

  def test_that_it_uses_the_configuration_value_when_token_is_not_specified
    ::Uach::Sega.configuration.api_token = '123FakeENV'
    default_client = ::Uach::Sega::Client.new
    assert_equal '123FakeENV', default_client.api_token
  end
end
