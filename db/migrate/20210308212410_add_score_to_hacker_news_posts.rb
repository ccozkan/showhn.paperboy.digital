class AddScoreToHackerNewsPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :hacker_news_posts, :score, :integer
  end
end
