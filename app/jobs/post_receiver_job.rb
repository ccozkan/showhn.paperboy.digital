class PostReceiverJob < ApplicationJob
  queue_as :default

  def perform(*args)
    posts_from_hacker_news = PostReceiverServices::HackerNews::StoriesReceiver.new.call

    if posts_from_hacker_news.success?
      posts_from_hacker_news.payload.each do |item_id|
        post_detail = PostReceiverServices::HackerNews::ItemDetailReceiver.new(item_id).call
        next if !post_detail.success?

        post_detail = post_detail.payload.parsed_response
        next if post_detail.nil? || HackerNewsPost.find_by(external_id: post_detail['id']).present?

        url = post_detail.fetch('url', nil)
        text = post_detail.fetch('text', nil)
        title = post_detail.fetch('title', nil)
        posted_at = DateTime.strptime(post_detail['time'].to_s, '%s')

        HackerNewsPost.create!(url: url, text: text, title: title,
                               posted_at: posted_at, external_id: post_detail['id'])
      end
    end
  end
end
