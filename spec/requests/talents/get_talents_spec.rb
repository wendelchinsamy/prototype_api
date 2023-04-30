# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Talents", type: :request) do
  describe "GET /index" do
    before do
      create_list(:talent, 5)
      get "/talents"
    end

    it "returns all talents" do
      expect(json.size).to(eq(5))
    end

    it "returns status code 200" do
      expect(response).to(have_http_status(:success))
    end
  end
end
