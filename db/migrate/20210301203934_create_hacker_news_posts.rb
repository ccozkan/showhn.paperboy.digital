class CreateHackerNewsPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :hacker_news_posts do |t|
      t.string :external_id
      t.string :url
      t.text :text
      t.string :title
      t.datetime :posted_at

      t.timestamps
    end
    add_index :hacker_news_posts, :external_id, unique: true
  end
end
