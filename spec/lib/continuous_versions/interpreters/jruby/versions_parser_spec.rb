# frozen_string_literal: true

RSpec.describe ContinuousVersions::Interpreters::Jruby::VersionsParser do
  describe '#call' do
    subject { described_class.new.call(rss) }

    context 'when rss does not contain ruby releases' do
      let(:rss) { RSS::Parser.parse read_fixture('jruby_no_releases.xml') }

      it { is_expected.to eq [] }
    end

    context 'when ruby release announcement is within rss' do
      let(:rss) { RSS::Parser.parse read_fixture('jruby_with_releases.xml') }

      it { is_expected.to eq ['9.1.17.0'] }
    end
  end
end
