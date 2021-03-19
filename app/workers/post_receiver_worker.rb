class PostReceiverWorker
  include Sidekiq::Worker

  def perform(*args)
    api_url = HackerNewsPost.api_url_for_show_stories
    posts = RequestMakerService.new(api_url).call
    unless posts.success?
      Honeybadger.notify(posts.errors)
      return
    end

    posts.payload.each do |item_id|
      api_url = HackerNewsPost.api_url_for_item_details(item_id)
      post_detail = RequestMakerService.new(api_url).call
      unless posts.success?
        Honeybadger.notify(post_details.errors)
        next
      end

      post_detail = post_detail.payload.parsed_response
      next if HackerNewsPost.find_by(external_id: post_detail['id']).present?

      params = HackerNewsPost.format_post_detail(post_detail)
      HackerNewsPost.create!(params)
    end
  end
end
