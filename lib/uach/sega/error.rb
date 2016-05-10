module Uach
  module Sega
    class Error < StandardError
      attr_reader :code

      def initialize(message, code = nil)
        super message
        @code = code
      end
    end
  end
end
