class LastPostsController < ApplicationController
  before_action :find_posts

  def index; end

  def feed; end

  private

  def find_posts
    @posts = HackerNewsPost.all
  end
end
