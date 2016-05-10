module Uach
  module Sega
    class Client
      include ::Uach::Sega::API

      attr_accessor :api_token
      base_uri 'http://services.uach.mx'

      def initialize(api_token = nil)
        @api_token = api_token || ::Uach::Sega.configuration.api_token
      end

      def countries(id = nil)
        get_from_api('/paises')
      end

      private

      def get_from_api(url)
        response = get_response(url)

        if response.code == '200'
          parse_json(response)
        else
          raise ::Uach::Sega::Error.new(response.code)
        end
      end
    end
  end
end
