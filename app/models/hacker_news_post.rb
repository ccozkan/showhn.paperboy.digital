class HackerNewsPost < ApplicationRecord
  validates_presence_of :external_id
  validates_uniqueness_of :external_id

  def self.api_url_for_item_details(item_id)
    "https://hacker-news.firebaseio.com/v0/item/#{item_id}.json"
  end

  def self.api_url_for_show_stories
    'https://hacker-news.firebaseio.com/v0/showstories.json'
  end

  def self.format_post_detail(post_detail)
    external_id = post_detail['id']
    score = post_detail['score'] || 0
    title = post_detail['title'].sub('Show HN: ', '')
    url = post_detail['url'] || "https://news.ycombinator.com/item?id=#{external_id}"
    posted_at = DateTime.strptime(post_detail['time'].to_s, '%s')

    { url: url, score: score, title: title, posted_at: posted_at, external_id: external_id }
  end

  def self.score_ordered_posts_of_last_week
    starting_at = self.last_week_time_period[:starting_at]
    ending_at = self.last_week_time_period[:ending_at]

    where('posted_at > ?', starting_at).where('posted_at <= ?', ending_at).order(score: :desc)
  end

  def self.top20_posts_of_last_week
    self.score_ordered_posts_of_last_issue.limit(20).to_a
  end

  def self.last_week_time_period
    starting_at = Date.today.prev_occurring(:wednesday).beginning_of_day + 12.hours
    {
      starting_at: starting_at,
      ending_at: starting_at + 7.days
    }
  end
end
