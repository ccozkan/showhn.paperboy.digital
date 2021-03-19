require 'rails_helper'

RSpec.describe 'Subscriptions', type: :request do
  describe 'POST' do
    before { post '/subscriptions', params: { email: 'foo@bar.com' }}

    it 'gets redirected' do
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
    end

    it 'creates its subscription record' do
      expect(Subscription.find_by(email: 'foo@bar.com')).not_to eq nil
    end
  end
end
