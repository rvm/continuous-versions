# frozen_string_literal: true

RSpec.describe ContinuousVersions::RssFromUrlFetcher do
  subject(:fetcher) { described_class.new }

  describe '#call' do
    subject(:call_fetcher) { fetcher.call(url) }

    let(:url) { 'http://www.ruby-lang.org/en/feeds/news.rss' }
    let(:rss_sample) { read_fixture('mri_no_releases.xml') }

    context 'when RSS is retrieved from URL successfully' do
      before do
        stub_request(:get, url).to_return(body: rss_sample)
      end

      it 'calls open-uri open of the url' do
        call_fetcher
        expect(WebMock).to have_requested(:get, url)
      end

      it 'returns a parsed rss' do
        expect(call_fetcher.items.first.title).to eq 'hello'
      end
    end

    context 'when there was an error retrieving RSS from URL' do
      before do
        stub_request(:get, url).to_raise(OpenURI::HTTPError.new('', nil))
      end

      it { is_expected.to be_nil }
    end
  end
end
