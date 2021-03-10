class HackerNewsPost < ApplicationRecord
  validates_presence_of :external_id
  validates_uniqueness_of :external_id

  def self.score_ordered_posts_of_last_week
    where('posted_at >= ?', 1.week.ago).order(score: :desc)
  end

  def self.api_url_for_item_details(item_id)
    "https://hacker-news.firebaseio.com/v0/item/#{item_id}.json"
  end

  def self.api_url_for_show_stories
    'https://hacker-news.firebaseio.com/v0/showstories.json'
  end
end
