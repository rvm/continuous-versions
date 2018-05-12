# frozen_string_literal: true

module ContinuousVersions
  module Interpreters
    module Mri
      class VersionsParser
        NEW_VERSION_REGEX = /^Ruby ([\d.\w_-]+) released[!?.,]*$/i

        def call(rss_feed)
          rss_feed.items.map do |item|
            item.title.scan(NEW_VERSION_REGEX).to_a.flatten.first
          end.compact
        end
      end
    end
  end
end
