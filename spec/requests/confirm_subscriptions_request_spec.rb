require "rails_helper"

RSpec.describe "ConfirmSubscriptions", type: :request do
  let(:subscription) { create(:subscription, confirmed_at: nil) }

  describe "successfull subscription confirmation" do
    before { get "/confirm/" + subscription.confirm_token }

    it do
      expect(response).to have_http_status(:success)
      expect(response.body).to include "subscription is now confirmed"
    end
  end

  describe "invalid confirmation link" do
    before { get "/confirm/" + "invalid_token" }

    it "get redirected" do
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq nil
    end
  end

  describe "already confirmed" do
    before do
      subscription.confirm!
      get "/confirm/" + subscription.confirm_token
    end

    it do
      expect(response).to have_http_status(:success)
      expect(response.body).to include "already confirmed"
    end
  end
end
