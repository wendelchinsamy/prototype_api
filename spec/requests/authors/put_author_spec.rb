# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Authors", type: :request) do
  describe "PUT /update" do
    let(:author) { create(:author, name: "Jane Doe") }

    describe "with valid parameters" do
      before do
        put "/authors/#{author.id}", params: { author: { name: "John Doe" } }
      end

      it "returns author" do
        expect(json["id"]).to(eq(author.id))
        expect(json["name"]).to(eq("John Doe"))
      end

      it "returns an ok status" do
        expect(response).to(have_http_status(:ok))
      end
    end

    describe "with invalid parameters" do
      before do
        put "/authors/#{author.id}", params: { author: { name: nil } }
      end

      it "returns an unprocessable entity status" do
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end

    describe "with unknown author id" do
      it "returns a not found status" do
        allow(Author).to(receive(:find_by).and_return(nil))
        put "/authors/1"
        expect(response).to(have_http_status(:not_found))
      end
    end
  end
end
