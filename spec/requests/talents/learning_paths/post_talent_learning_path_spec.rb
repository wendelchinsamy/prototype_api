# frozen_string_literal: true

require "rails_helper"

RSpec.describe("TalentLearningPaths", type: :request) do
  describe "POST /create" do
    describe "with valid parameters" do
      let(:learning_path) { create(:learning_path, courses: create_list(:course, 3)) }
      let(:talent) { create(:talent) }

      before do
        post "/talents/#{talent.id}/learning_paths",
          params: { talent_learning_path: { learning_path_id: learning_path.id } }
      end

      it "returns learning path talent" do
        expect(json["learning_path_id"]).to(eq(learning_path.id))
        expect(json["talent_id"]).to(eq(talent.id))
      end

      it "returns a created status" do
        expect(response).to(have_http_status(:created))
      end
    end

    describe "with invalid parameters" do
      before do
        post "/talents/1/learning_paths", params: { talent_learning_path: { learning_path_id: nil } }
      end

      it "returns an unprocessable entity status" do
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end
end
