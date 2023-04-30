# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Courses", type: :request) do
  describe "GET /show" do
    let(:course) { create(:course, id: 1) }

    before do
      get "/courses/#{course.id}"
    end

    it "returns course" do
      expect(json["id"]).to(eq(course.id))
    end

    it "returns status code 200" do
      expect(response).to(have_http_status(:success))
    end
  end

  describe "with unknown course id" do
    it "returns a not found status" do
      allow(Course).to(receive(:find_by).and_return(nil))
      get "/courses/1"
      expect(response).to(have_http_status(:not_found))
    end
  end
end
