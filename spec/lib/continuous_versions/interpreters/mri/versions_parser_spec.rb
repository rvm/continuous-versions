# frozen_string_literal: true

RSpec.describe ContinuousVersions::Interpreters::Mri::VersionsParser do
  describe '#call' do
    subject { described_class.new.call(rss) }

    context 'when rss does not contain ruby releases' do
      let(:rss) { RSS::Parser.parse read_fixture('mri_no_releases.xml') }

      it { is_expected.to eq [] }
    end

    context 'when ruby release announcement is within rss' do
      let(:rss) { RSS::Parser.parse read_fixture('mri_with_releases.xml') }

      it { is_expected.to eq ['2.5.1'] }
    end
  end
end
