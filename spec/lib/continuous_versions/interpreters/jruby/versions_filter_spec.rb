# frozen_string_literal: true

RSpec.describe ContinuousVersions::Interpreters::Jruby::VersionsFilter do
  describe '#call' do
    subject { described_class.new.call(versions) }

    let(:versions) { %w[1.4.0 9.1.17.0] }

    before do
      stub_request(:get, described_class::RVM_CONFIG_MD5_URL).to_return(body: read_fixture('md5.txt'))
      stub_request(:get, 'https://s3.amazonaws.com/jruby.org/downloads/1.4.0/jruby-bin-1.4.0.tar.gz.md5')
        .to_return(body: 'f37322c18e9134e91e064aebb4baa4c7')
      stub_request(:get, 'https://s3.amazonaws.com/jruby.org/downloads/9.1.17.0/jruby-bin-9.1.17.0.tar.gz.md5')
        .to_return(body: '772eaa3cb006f80437d69fb36fcb5fb6')
    end

    it { is_expected.to eq ['jruby-bin-9.1.17.0.tar.gz=772eaa3cb006f80437d69fb36fcb5fb6'] }
  end
end
