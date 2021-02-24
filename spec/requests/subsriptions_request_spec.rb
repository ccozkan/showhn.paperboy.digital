require 'rails_helper'

RSpec.describe 'Subscriptions', type: :request do
  describe 'subscribing user' do
    it 'get redirects' do
      post '/subscriptions', params: { email: 'foo@bar.com' }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
      expect(Subscription.find_by(email: 'foo@bar.com')).not_to eq nil
    end
  end
end
