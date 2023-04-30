# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Courses", type: :request) do
  describe "GET /index" do
    before do
      create_list(:course, 5)
      get "/courses"
    end

    it "returns all courses" do
      expect(json.size).to(eq(5))
    end

    it "returns status code 200" do
      expect(response).to(have_http_status(:success))
    end
  end
end
