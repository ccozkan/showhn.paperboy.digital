class HackerNewsPost < ApplicationRecord
  validates_presence_of :external_id
  validates_uniqueness_of :external_id

  def self.posts_since_last_week
    where('posted_at >= ?', 1.week.ago)
  end
end
