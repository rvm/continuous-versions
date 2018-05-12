# frozen_string_literal: true

module ContinuousVersions
  module BuildInteractions
    class Trigger
      def call(versions)
        return if versions.blank?
        puts 'Triggering the build for versions: ', versions
      end
    end
  end
end
