# frozen_string_literal: true

module ContinuousVersions
  class PrSubmitter
    def call(file_signatures)
      puts 'Submitting a PR for file signatures: ', file_signatures
    end
  end
end
