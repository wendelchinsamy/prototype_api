# frozen_string_literal: true

require "rails_helper"

RSpec.describe("LearningPaths", type: :request) do
  describe "GET /index" do
    before do
      create_list(:learning_path, 5)
      get "/learning_paths"
    end

    it "returns all learning path" do
      expect(json.size).to(eq(5))
    end

    it "returns status code 200" do
      expect(response).to(have_http_status(:success))
    end
  end
end
