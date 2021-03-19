require 'rails_helper'

RSpec.describe 'Unsubscriptions', type: :request do
  describe 'unsubscribing user' do
    let(:subscription) { create(:subscription)}
    before { get '/unsubscribe/' + subscription.unsub_token }

    it 'get redirected' do
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end

    it 'deletes its subscription' do
      expect(Subscription.find_by(email: subscription.email)).to eq nil
    end
  end
end
