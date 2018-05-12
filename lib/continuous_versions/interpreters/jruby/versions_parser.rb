# frozen_string_literal: true

module ContinuousVersions
  module Interpreters
    module Jruby
      class VersionsParser
        NEW_VERSION_REGEX = /^JRuby ([\d.\w_-]+) released[!?.,]*$/i

        def call(rss_feed)
          rss_feed.entries.map do |entry|
            entry.title.content.scan(NEW_VERSION_REGEX).to_a.flatten.first
          end.compact
        end
      end
    end
  end
end
