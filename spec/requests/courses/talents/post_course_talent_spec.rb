# frozen_string_literal: true

require "rails_helper"

RSpec.describe("CourseTalents", type: :request) do
  describe "POST /create" do
    describe "with valid parameters" do
      let(:course) { create(:course, author: create(:author)) }
      let(:talent) { create(:talent, author: create(:author)) }

      before do
        post "/courses/#{course.id}/talents",
          params: { course_talent: { talent_id: talent.id } }
      end

      it "returns course talent" do
        expect(json["course_id"]).to(eq(course.id))
        expect(json["talent_id"]).to(eq(talent.id))
      end

      it "returns a created status" do
        expect(response).to(have_http_status(:created))
      end
    end

    describe "with invalid parameters" do
      before do
        post "/courses/1/talents", params: { course_talent: { talent_id: nil } }
      end

      it "returns an unprocessable entity status" do
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end
end
