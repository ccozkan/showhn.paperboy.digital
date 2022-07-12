# == Schema Information
#
# Table name: hacker_news_posts
#
#  id          :bigint           not null, primary key
#  external_id :string
#  url         :string
#  title       :string
#  posted_at   :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  score       :integer
#
class HackerNewsPost < ApplicationRecord
  validates_presence_of :external_id
  validates_uniqueness_of :external_id

  def self.api_url_for_item_details(item_id)
    "https://hacker-news.firebaseio.com/v0/item/#{item_id}.json"
  end

  def self.api_url_for_show_stories
    "https://hacker-news.firebaseio.com/v0/showstories.json"
  end

  def self.format_post_detail(post_detail)
    external_id = post_detail["id"]
    score = post_detail["score"] || 0
    title = post_detail["title"].sub("Show HN: ", "")
    url = post_detail["url"] || "https://news.ycombinator.com/item?id=#{external_id}"
    posted_at = DateTime.strptime(post_detail["time"].to_s, "%s")

    { url:, score:, title:, posted_at:, external_id: }
  end

  def self.score_ordered_posts_of_last_week
    last_week = last_week_time_period
    starting_at = last_week[:starting_at]
    ending_at = last_week[:ending_at]

    where("posted_at > ?", starting_at).where("posted_at <= ?", ending_at).order(score: :desc)
  end

  def self.top20_posts_of_last_week
    score_ordered_posts_of_last_week.limit(20).to_a
  end

  def self.this_week_time_period
    last_week = last_week_time_period
    {
      starting_at: last_week[:starting_at] + 7.days,
      ending_at: last_week[:ending_at] + 7.days,
    }
  end

  def self.last_week_time_period
    starting_at = Date.tomorrow.prev_occurring(:wednesday).beginning_of_day - 7.days + 12.hours
    {
      starting_at:,
      ending_at: starting_at + 7.days,
    }
  end
end
