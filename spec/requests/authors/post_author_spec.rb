# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Author", type: :request) do
  describe "POST /create" do
    describe "with valid parameters" do
      before do
        post "/authors", params: { author: { name: "John Doe" } }
      end

      it "returns author" do
        expect(json["name"]).to(eq("John Doe"))
      end

      it "returns a created status" do
        expect(response).to(have_http_status(:created))
      end
    end

    describe "with invalid parameters" do
      before do
        post "/authors", params: { author: { name: nil } }
      end

      it "returns an unprocessable entity status" do
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end
end
