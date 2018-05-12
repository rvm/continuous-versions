# frozen_string_literal: true

module ContinuousVersions
  module Interpreters
    module Mri
      RSS_URL = 'http://www.ruby-lang.org/en/feeds/news.rss'

      def self.call
        [RssFromUrlFetcher, VersionsParser, BuildInteractions::Trigger].reduce(RSS_URL) do |output, klass|
          result = klass.new.call(output)
          break if result.nil?
          result
        end
      end
    end
  end
end
