# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Talents", type: :request) do
  describe "GET /show" do
    let(:talent) { create(:talent) }

    before do
      get "/talents/#{talent.id}"
    end

    it "returns talent" do
      expect(json["id"]).to(eq(talent.id))
    end

    it "returns status code 200" do
      expect(response).to(have_http_status(:success))
    end
  end

  describe "with unknown talent id" do
    it "returns a not found status" do
      allow(Talent).to(receive(:find_by).and_return(nil))
      get "/talents/1"
      expect(response).to(have_http_status(:not_found))
    end
  end
end
