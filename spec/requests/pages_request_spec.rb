require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "GET #home" do
    before { get "/" }
    it { expect(response).to have_http_status(:success) }
  end
end
