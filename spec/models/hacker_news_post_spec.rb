require 'rails_helper'

RSpec.describe HackerNewsPost, type: :model do
  describe 'model consistency' do
    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_uniqueness_of(:external_id) }
  end
end
