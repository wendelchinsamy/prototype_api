# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Courses", type: :request) do
  describe "PUT /update" do
    let(:course) { create(:course) }
    let(:path) { create(:learning_path) }

    describe "with valid parameters" do
      before do
        put "/courses/#{course.id}",
          params: { course: { name: "Test Course", learning_path_id: path.id } }
      end

      it "returns course" do
        expect(json["id"]).to(eq(course.id))
        expect(json["name"]).to(eq("Test Course"))
        expect(json["learning_path_id"]).to(eq(path.id))
      end

      it "returns an ok status" do
        expect(response).to(have_http_status(:ok))
      end
    end

    describe "with invalid parameters" do
      before do
        put "/courses/#{course.id}", params: { course: { name: nil } }
      end

      it "returns an unprocessable entity status" do
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end

    describe "with unknown course id" do
      it "returns a not found status" do
        allow(Course).to(receive(:find_by).and_return(nil))
        put "/courses/1"
        expect(response).to(have_http_status(:not_found))
      end
    end
  end
end
