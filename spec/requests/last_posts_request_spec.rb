require "rails_helper"

RSpec.describe "LastPosts", type: :request do

  describe "#index" do
    before { get "/last" }

    it { expect(response).to have_http_status(:success) }
  end

  describe "#feed" do
    before { get "/feed" }

    it { expect(response).to have_http_status(:success) }
  end
end
