# frozen_string_literal: true

require "rails_helper"

RSpec.describe("LearningPaths", type: :request) do
  describe "POST /create" do
    describe "with valid parameters" do
      before do
        post "/learning_paths", params: { learning_path: { name: "Test Path" } }
      end

      it "returns learning path" do
        expect(json["name"]).to(eq("Test Path"))
      end

      it "returns a created status" do
        expect(response).to(have_http_status(:created))
      end
    end

    describe "with invalid parameters" do
      before do
        post "/learning_paths", params: { learning_path: { name: nil } }
      end

      it "returns an unprocessable entity status" do
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end
end
