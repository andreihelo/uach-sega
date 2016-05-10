require 'uach/sega/module_inheritable_attributes'
require 'net/http'

module Uach
  module Sega
    module API
      def self.included(base)
        base.extend ClassMethods
        base.send :include, ModuleInheritableAttributes
        base.send(:mattr_inheritable, :default_options)
        base.instance_variable_set('@default_options', {})
      end

      module ClassMethods
        def base_uri(uri = nil)
          return default_options[:base_uri] unless uri
          default_options[:base_uri] = API.normalize_base_uri(uri)
        end
      end

      def get_response(url)
        uri = URI(self.class.base_uri + url)
        Net::HTTP.get_response(uri)
      end

      def parse_json(response)
        JSON.parse(response.body, symbolize_names: Sega.configuration.symbolize_keys)
      end

      private

      def self.normalize_base_uri(url)
        normalized_url = url.dup
        use_ssl = (normalized_url =~ /^https/) || (normalized_url =~ /:443\b/)
        ends_with_slash = normalized_url =~ /\/$/

        normalized_url.chop! if ends_with_slash
        normalized_url.gsub!(/^https?:\/\//i, '')

        "http#{'s' if use_ssl}://#{normalized_url}"
      end
    end
  end
end
