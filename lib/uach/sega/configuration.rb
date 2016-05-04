module Uach
  module Sega
    class Configuration
      attr_accessor :symbolize_keys, :api_token

      def initialize
        @symbolize_keys = false
      end
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configuration=(config)
      @configuration = config
    end

    def self.configure
      yield configuration
    end
  end
end
