# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Talents", type: :request) do
  describe "POST /create" do
    describe "with valid parameters" do
      let(:author) { create(:author) }

      before do
        post "/talents", params: { talent: { name: "John Doe", author_id: author.id } }
      end

      it "returns talent" do
        expect(json["name"]).to(eq("John Doe"))
        expect(json["author_id"]).to(eq(author.id))
      end

      it "returns a created status" do
        expect(response).to(have_http_status(:created))
      end
    end

    describe "with invalid parameters" do
      before do
        post "/talents", params: { talent: { name: nil } }
      end

      it "returns an unprocessable entity status" do
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end
end
