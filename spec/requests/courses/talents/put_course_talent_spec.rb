# frozen_string_literal: true

require "rails_helper"

RSpec.describe("CourseTalents", type: :request) do
  describe "PUT /update" do
    let(:learning_path) { create(:learning_path) }
    let(:course_1) { create(:course, learning_path:) }
    let(:course_2) { create(:course, learning_path:) }
    let(:talent) { create(:talent) }
    let(:course_talent) { create(:course_talent, course: course_1, talent:, completed: false) }

    describe "with valid parameters" do
      before do
        put "/courses/#{course_talent.course_id}/talents/#{course_talent.talent_id}",
          params: { course_talent: { completed: true } }
      end

      it "returns course talent" do
        expect(json["id"]).to(eq(course_talent.id))
        expect(json["course_id"]).to(eq(course_talent.course_id))
        expect(json["talent_id"]).to(eq(course_talent.talent_id))
        expect(json["completed"]).to(eq(true))
      end

      it "returns an ok status" do
        expect(response).to(have_http_status(:ok))
      end
    end

    describe "with unknown course or talent id" do
      it "returns a not found status" do
        allow(CourseTalent).to(receive(:find_by).and_return(nil))
        put "/courses/1/talents/1"
        expect(response).to(have_http_status(:not_found))
      end
    end
  end
end
