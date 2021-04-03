class LastPostsController < ApplicationController
  before_action :find_posts, only: [:index]

  def index;end

  private

  def find_posts
    @posts = HackerNewsPost.score_ordered_posts_of_last_week
  end
end
