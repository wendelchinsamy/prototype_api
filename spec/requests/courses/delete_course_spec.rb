# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Courses", type: :request) do
  describe "DELETE /destroy" do
    describe "with valid parameters" do
      let(:course) { create(:course) }

      before do
        delete "/courses/#{course.id}"
      end

      it "returns a no content status" do
        expect(response).to(have_http_status(:no_content))
      end
    end

    describe "with unknown course id" do
      it "returns a not found status" do
        allow(Course).to(receive(:find_by).and_return(nil))
        delete "/courses/1"
        expect(response).to(have_http_status(:not_found))
      end
    end
  end
end
