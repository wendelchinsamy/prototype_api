# frozen_string_literal: true

require "rails_helper"

RSpec.describe("LearningPaths", type: :request) do
  describe "GET /show" do
    before do
      create(:learning_path, id: 1, name: "Test Path")
      get "/learning_paths/1"
    end

    it "returns learning path" do
      expect(json["id"]).to(eq(1))
    end

    it "returns status code 200" do
      expect(response).to(have_http_status(:success))
    end
  end

  describe "with unknown learning path id" do
    it "returns a not found status" do
      allow(LearningPath).to(receive(:find_by).and_return(nil))
      get "/learning_paths/1"
      expect(response).to(have_http_status(:not_found))
    end
  end
end
