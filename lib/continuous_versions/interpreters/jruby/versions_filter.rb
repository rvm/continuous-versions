# frozen_string_literal: true

module ContinuousVersions
  module Interpreters
    module Jruby
      class VersionsFilter
        RVM_CONFIG_MD5_URL = 'https://raw.githubusercontent.com/rvm/rvm/master/config/md5'
        # 'https://raw.githubusercontent.com/rvm/rvm/ba6894df6ca9794b0ada7c70143af2125c48ba88/config/md5'
        JRUBY_PREFIX = 'jruby-bin-'

        def call(versions)
          uri = URI.parse(RVM_CONFIG_MD5_URL)
          config_md5_contents = uri.open.readlines.map(&:strip).select do |line|
            line.start_with? JRUBY_PREFIX
          end

          versions.map { |version| file_signature_for version } - config_md5_contents
        end

        private

        def file_signature_for(version)
          return if version.nil?

          file_name = "jruby-bin-#{version}.tar.gz"
          md5_uri = URI.parse("https://s3.amazonaws.com/jruby.org/downloads/#{version}/#{file_name}.md5")
          md5 = md5_uri.open.read.strip
          "#{file_name}=#{md5}"
        end
      end
    end
  end
end
