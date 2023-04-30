# frozen_string_literal: true

require "rails_helper"

RSpec.describe("CourseTalents", type: :request) do
  describe "DELETE /destroy" do
    describe "with valid parameters" do
      let(:course_talent) { create(:course_talent, course: create(:course), talent: create(:talent)) }

      before do
        delete "/courses/#{course_talent.course_id}/talents/#{course_talent.talent_id}"
      end

      it "returns a no content status" do
        expect(response).to(have_http_status(:no_content))
      end
    end

    describe "with unknown course id" do
      it "returns a not found status" do
        allow(CourseTalent).to(receive(:find_by).and_return(nil))
        delete "/courses/1/talents/1"
        expect(response).to(have_http_status(:not_found))
      end
    end
  end
end
