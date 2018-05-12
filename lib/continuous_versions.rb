# frozen_string_literal: true

require 'active_support'
require 'active_support/dependencies'
require 'rss'
require 'open-uri'

ActiveSupport::Dependencies.autoload_paths << File.join(File.dirname(__FILE__), 'ruby_version_checker')
$LOAD_PATH.unshift(File.dirname(__FILE__))

module ContinuousVersions
  extend ActiveSupport::Autoload

  autoload :PrSubmitter
  autoload :RssFromUrlFetcher

  module BuildInteractions
    extend ActiveSupport::Autoload

    autoload :Listener
    autoload :Trigger
  end

  module Interpreters
    extend ActiveSupport::Autoload

    autoload :Jruby
    autoload :Mri

    module Jruby
      extend ActiveSupport::Autoload

      autoload :VersionsFilter
      autoload :VersionsParser
    end

    module Mri
      extend ActiveSupport::Autoload

      autoload :VersionsParser
    end
  end

  def self.start
    Interpreters::Jruby.call
    # Interpreters::Mri.call
  end
end
