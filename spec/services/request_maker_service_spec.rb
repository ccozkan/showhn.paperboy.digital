require 'rails_helper'

RSpec.describe RequestMakerService, type: :service do
  describe '#call' do
    let(:url) { 'https://ozkan.cc' }
    let(:response) { RequestMakerService.new(url).call }

    context 'when success' do
      it do
        expect(response.success?).to eq true
        expect(response.payload).not_to eq nil
        expect(response.error).to eq nil
      end
    end

    context 'when not success' do
      before do
        allow(HTTParty).to receive(:get).and_raise(HTTParty::Error)
      end

      it do
        expect(response.success?).to eq false
        expect(response.payload).to eq nil
        expect(response.error).not_to eq nil
      end
    end
  end
end
