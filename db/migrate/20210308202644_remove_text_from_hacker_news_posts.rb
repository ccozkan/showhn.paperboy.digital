class RemoveTextFromHackerNewsPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :hacker_news_posts, :text
  end
end
