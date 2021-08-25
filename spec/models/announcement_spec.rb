require 'rails_helper'

RSpec.describe Announcement, type: :model do
  describe 'model consistency' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:announced_at) }
  end
end
