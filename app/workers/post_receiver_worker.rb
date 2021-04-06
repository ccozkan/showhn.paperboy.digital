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

      unless post_detail.success?
        Honeybadger.notify(post_details.errors)
        next
      end

      post_detail = post_detail.payload.parsed_response
      next if post_detail.nil?

      params = HackerNewsPost.format_post_detail(post_detail)
      next if params[:posted_at] < HackerNewsPost.last_week_time_period[:starting_at]

      post = HackerNewsPost.find_by(external_id: params[:external_id])

      if post.nil?
        HackerNewsPost.create(params)
      elsif params[:posted_at] < HackerNewsPost.last_week_time_period[:ending_at]
        post.update(score: params[:score])
      end
    end
  end
end
