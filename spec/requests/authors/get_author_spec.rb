# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Authors", type: :request) do
  describe "GET /show" do
    let(:author) { create(:author, id: 1) }

    before do
      get "/authors/#{author.id}"
    end

    it "returns author" do
      expect(json["id"]).to(eq(author.id))
    end

    it "returns status code 200" do
      expect(response).to(have_http_status(:success))
    end
  end

  describe "with unknown author id" do
    it "returns a not found status" do
      allow(Author).to(receive(:find_by).and_return(nil))
      get "/authors/1"
      expect(response).to(have_http_status(:not_found))
    end
  end
end
