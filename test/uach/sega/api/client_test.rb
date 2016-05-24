require 'test_helper'

class Uach::ClientTest < Minitest::Test
  FAKE_API_TOKEN = '123FakeToken'

  def setup
    ::Uach::Sega.configuration.symbolize_keys = true
    @client = ::Uach::Sega::Client.new(FAKE_API_TOKEN)
  end

  def test_that_it_has_a_base_uri
    refute_nil ::Uach::Sega::Client.base_uri
    assert_equal 'http://services.uach.mx', ::Uach::Sega::Client.base_uri
  end

  def test_that_it_has_an_api_token
    assert_equal FAKE_API_TOKEN, @client.api_token
  end

  def test_that_it_uses_the_configuration_value_when_token_is_not_specified
    ::Uach::Sega.configuration.api_token = '123FakeENV'
    default_client = ::Uach::Sega::Client.new
    assert_equal '123FakeENV', default_client.api_token
  end

  def test_that_countries_returns_a_response
    VCR.use_cassette('client/countries') do
      @countries_response = @client.countries
    end

    refute_nil @countries_response
  end

  def test_that_countries_returns_an_array_of_countries
    VCR.use_cassette('client/countries') do
      @countries_response = @client.countries
    end

    assert_instance_of Array, @countries_response
  end
end
