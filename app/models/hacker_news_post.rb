class HackerNewsPost < ApplicationRecord
  validates_presence_of :external_id
  validates_uniqueness_of :external_id

  def self.score_ordered_posts_of_last_week
    where('posted_at >= ?', 1.week.ago).order(score: :desc).to_a
  end

  def self.api_url_for_item_details(item_id)
    "https://hacker-news.firebaseio.com/v0/item/#{item_id}.json"
  end

  def self.api_url_for_show_stories
    'https://hacker-news.firebaseio.com/v0/showstories.json'
  end

  def self.format_post_detail(post_detail)
    url = post_detail['url']
    score = post_detail['score']
    title = post_detail['title'].sub('Show HN: ', '')
    posted_at = DateTime.strptime(post_detail['time'].to_s, '%s')
    external_id = post_detail['id']

    { url: url, score: score, title: title, posted_at: posted_at, external_id: external_id }
  end
end
