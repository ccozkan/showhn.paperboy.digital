require 'rails_helper'

RSpec.describe HackerNewsPost, type: :model do
  describe 'model consistency' do
    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_uniqueness_of(:external_id) }
  end

  describe '.score_ordered_posts_of_last_week' do
    let!(:most_popular_post) { HackerNewsPost.create(external_id: 'abc',
                                                     score: 100,
                                                     posted_at: Date.today - 2.days) }
    let!(:less_popular_post) { HackerNewsPost.create(external_id: 'xyz',
                                                     score: 50,
                                                     posted_at: Date.today - 1.day) }

    let!(:last_weeks_popular_post) { HackerNewsPost.create(external_id: 'ijk',
                                                           score: 500,
                                                           posted_at: Date.today - 7.days) }
    let!(:subject) { HackerNewsPost.score_ordered_posts_of_last_week}

    it do
      expect(subject).to eq [most_popular_post, less_popular_post]
    end

    it do
      expect(subject.is_a? Array).to be true
    end
  end
end
