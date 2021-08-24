require "rails_helper"

RSpec.describe Subscription, type: :model do
  describe "model consistency" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to have_secure_token(:unsub_token) }
    it { is_expected.to have_secure_token(:confirm_token) }
    it { is_expected.to allow_value("email@addresse.foo").for(:email) }
    it { is_expected.not_to allow_value("foo").for(:email) }
  end

  describe "#confirm?" do
    context "when true" do
      let(:subscription) { create(:subscription, confirmed_at: nil) }

      it { expect(subscription.confirmed?).to eq false }
    end

    context "when false" do
      let(:subscription) { create(:subscription, confirmed_at: Time.current.utc) }

      it { expect(subscription.confirmed?).to eq true }
    end
  end

  describe "#confirm!" do
    let(:subscription) { create(:subscription, confirmed_at: nil) }
    before { subscription.confirm! }

    it { expect(subscription.confirmed?).to eq true }
  end

  describe ".confirmed_subscriptions" do
    let(:not_confirmed_sub) { create(:subscription, confirmed_at: nil) }
    let(:confirmed_sub) { create(:subscription) }

    it { expect(Subscription.confirmed_subscriptions).to eq [confirmed_sub] }
  end
end
