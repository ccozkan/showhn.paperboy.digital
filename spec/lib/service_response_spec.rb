require "rails_helper"

RSpec.describe ServiceResponse, type: :lib do
  describe 'when valid' do
    context 'when successfull' do
      let(:subject) { ServiceResponse.new(payload: 42) }

      it { expect(subject.success?).to eq true }
    end

    context 'when unsuccessfull' do
      let(:subject) { ServiceResponse.new(error: 'ImAnErrorLOL') }

      it { expect(subject.success?).to eq false }
    end
  end

  describe 'when invalid' do
    context do
      let(:subject) { ServiceResponse.new(payload: 42, error: 'ImAnErrorLOL') }

      it { expect{ subject }.to raise_error ServiceResponse::PayloadAndErrorPresenceInconsistency }
    end

    context do
      let(:subject) { ServiceResponse.new(payload: nil, error: nil) }

      it { expect{ subject }.to raise_error ServiceResponse::PayloadAndErrorPresenceInconsistency }
    end
  end
end
