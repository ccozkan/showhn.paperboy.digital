require 'rails_helper'

RSpec.describe Datum, type: :model do
  describe 'model consistency' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
  end
end
