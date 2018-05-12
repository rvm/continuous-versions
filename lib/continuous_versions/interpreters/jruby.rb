# frozen_string_literal: true

module ContinuousVersions
  module Interpreters
    module Jruby
      RSS_URL = 'http://jruby.org/atom.xml'

      def self.call
        [RssFromUrlFetcher, VersionsParser, VersionsFilter, PrSubmitter].reduce(RSS_URL) do |output, klass|
          result = klass.new.call(output)
          break if result.nil?
          result
        end
      end
    end
  end
end
