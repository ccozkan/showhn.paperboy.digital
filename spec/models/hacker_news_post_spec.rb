require 'rails_helper'

RSpec.describe HackerNewsPost, type: :model do
  describe 'model consistency' do
    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_uniqueness_of(:external_id) }
  end

  describe '.score_ordered_posts_of_last_week' do
    let!(:most_popular_post) { create(:hacker_news_post, score: 100, posted_at: Date.today - 2.days) }
    let!(:less_popular_post) { create(:hacker_news_post, score: 10, posted_at: Date.today - 1.days) }
    let!(:last_weeks_popular_post) { create(:hacker_news_post, score: 10, posted_at: (Date.today - 7.days).beginning_of_day + 12.hours) }

    let!(:subject) { HackerNewsPost.score_ordered_posts_of_last_week}

    it { expect(subject).to eq [most_popular_post, less_popular_post] }
  end
end
