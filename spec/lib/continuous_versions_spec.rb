# frozen_string_literal: true

RSpec.describe ContinuousVersions do
  describe '.start' do
    subject(:start) { described_class.start }

    before do
      allow(described_class::Interpreters::Jruby).to receive(:call)
      start
    end

    it 'calls Jruby routine' do
      expect(described_class::Interpreters::Jruby).to have_received(:call)
    end
  end
end
