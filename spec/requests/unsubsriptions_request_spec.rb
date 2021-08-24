require "rails_helper"

RSpec.describe "Unsubscriptions", type: :request do
  describe "unsubscribing user" do
    context "when subscription exists" do
      let(:subscription) { create(:subscription) }
      before { get "/unsubscribe/" + subscription.unsub_token }

      it do
        expect(response).to have_http_status(:success)
        expect(response.body).to include "Successfully unsubscribed"
      end
    end

    context "when subscription does not exist" do
      before { get "/unsubscribe/" + "invalid_token" }

      it "get redirected" do
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
