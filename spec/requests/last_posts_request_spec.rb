require "rails_helper"

RSpec.describe "LastPosts", type: :request do
  let(:post) { FactoryBot.create(:hacker_news_post, posted_at: Date.today.prev_occurring(:wednesday).beginning_of_day) }

  describe "#index" do
    before { get "/last" }

    it do
      expect(response).to have_http_status(:success)
    end
  end
end
