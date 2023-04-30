# frozen_string_literal: true

require "rails_helper"

RSpec.describe("LearningPaths", type: :request) do
  describe "PUT /update" do
    let(:learning_path) { create(:learning_path) }

    describe "with valid parameters" do
      before do
        put "/learning_paths/#{learning_path.id}", params: { learning_path: { name: "Test Path" } }
      end

      it "returns learning path" do
        expect(json["id"]).to(eq(learning_path.id))
        expect(json["name"]).to(eq("Test Path"))
      end

      it "returns an ok status" do
        expect(response).to(have_http_status(:ok))
      end
    end

    describe "with invalid parameters" do
      before do
        put "/learning_paths/#{learning_path.id}", params: { learning_path: { name: nil } }
      end

      it "returns an unprocessable entity status" do
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end

    describe "with unknown learning path id" do
      it "returns a not found status" do
        allow(LearningPath).to(receive(:find_by).and_return(nil))
        put "/learning_paths/1"
        expect(response).to(have_http_status(:not_found))
      end
    end
  end
end
