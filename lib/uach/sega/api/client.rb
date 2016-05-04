module Uach
  module Sega
    class Client
      include ::Uach::Sega::API

      attr_accessor :api_token
      base_uri 'http://servicios.uach.mx'

      def initialize(api_token = nil)
        @api_token = api_token || ::Uach::Sega.configuration.api_token
      end
    end
  end
end
