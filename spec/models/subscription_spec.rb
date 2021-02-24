require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'model consistency' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to have_secure_token(:unsub_token) }
  end
end
