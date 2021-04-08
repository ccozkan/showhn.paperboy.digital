require 'rails_helper'

RSpec.describe HackerNewsPost, type: :model do
  describe 'model consistency' do
    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_uniqueness_of(:external_id) }
  end

  describe do
    let!(:starting_at) { Date.today - 7.days }
    let!(:ending_at) { starting_at + 7.days }
    let!(:mocked_last_week_time_period) { { starting_at: starting_at, ending_at: ending_at}}

    before do
      allow(HackerNewsPost).to receive(:last_week_time_period).and_return(mocked_last_week_time_period)
    end

    let!(:most_popular_post) { create(:hacker_news_post, score: 100, posted_at: starting_at + 1.day) }
    let!(:less_popular_post) { create(:hacker_news_post, score: 10, posted_at: starting_at + 2.days) }
    let!(:last_weeks_popular_post) { create(:hacker_news_post, score: 10, posted_at: starting_at - 1.day) }
    let!(:other_posts) { create_list(:hacker_news_post, 42, score: 5, posted_at: starting_at + 3.days) }

    describe '.score_ordered_posts_of_last_week' do
      let!(:subject) { HackerNewsPost.score_ordered_posts_of_last_week}

      it { expect(subject[0..1]).to eq [most_popular_post, less_popular_post] }
      it { expect(subject).not_to include last_weeks_popular_post }
      it { expect(subject.size).not_to eq 42 + 3 }
    end

    describe '.top20_posts_of_last_week' do
      let!(:subject) { HackerNewsPost.top20_posts_of_last_week }

      it { expect(subject.class).to eq Array }
      it { expect(subject.size).to eq  20 }
    end
  end

  describe do
    before { Timecop.freeze( Date.today.prev_occurring(:friday).beginning_of_day + 12.hours ) }
    after { Timecop.return }

    describe '.last_week_time_period' do
      let!(:subject) { HackerNewsPost.last_week_time_period }

      it do
        expect(subject[:starting_at] + 9.days).to eq Time.current
        expect(subject[:ending_at] + 2.days).to eq Time.current
      end
    end

    describe '.this_week_time_period' do
      let(:subject) { HackerNewsPost.this_week_time_period }

      it do
        expect(subject[:starting_at] + 2.days).to eq Time.current
        expect(subject[:ending_at] - 5.days).to eq Time.current
      end
    end
  end
end
