# frozen_string_literal: true

module ContinuousVersions
  class RssFromUrlFetcher
    def call(url)
      uri = URI.parse(url)
      RSS::Parser.parse(uri.open)
    rescue OpenURI::HTTPError
      nil
    end
  end
end
