# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Talents", type: :request) do
  describe "DELETE /destroy" do
    describe "with valid parameters" do
      let(:talent) { create(:talent) }

      before do
        delete "/talents/#{talent.id}"
      end

      it "returns a no content status" do
        expect(response).to(have_http_status(:no_content))
      end
    end

    describe "with unknown talent id" do
      it "returns a not found status" do
        allow(Talent).to(receive(:find_by).and_return(nil))
        delete "/talents/1"
        expect(response).to(have_http_status(:not_found))
      end
    end
  end
end
