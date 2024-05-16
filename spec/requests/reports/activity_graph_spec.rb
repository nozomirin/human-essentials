require "rails_helper"

RSpec.describe "Reports::ActivityGraph", type: :request, skip_seed: true do
  let(:organization) { create(:organization, skip_items: true) }
  let(:user) { create(:user, organization: organization) }

  describe "while signed in" do
    before do
      sign_in user
    end

    describe "GET #index" do
      subject do
        get reports_activity_graph_path(format: response_format)
        response
      end
      let(:response_format) { "html" }

      it { is_expected.to have_http_status(:success) }
    end
  end

  describe "while not signed in" do
    describe "GET /index" do
      subject do
        get reports_activity_graph_path
        response
      end

      it "redirect to login" do
        is_expected.to redirect_to(new_user_session_path)
      end
    end
  end
end