# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Courses", type: :request) do
  describe "POST /create" do
    describe "with valid parameters" do
      let(:author) { create(:author) }
      let(:path) { create(:learning_path) }

      before do
        post "/courses",
          params: {
            course: {
              name: "Test Course",
              author_id: author.id,
              learning_path_id: path.id,
            },
          }
      end

      it "returns course" do
        expect(json["name"]).to(eq("Test Course"))
        expect(json["author_id"]).to(eq(author.id))
        expect(json["learning_path_id"]).to(eq(path.id))
      end

      it "returns a created status" do
        expect(response).to(have_http_status(:created))
      end
    end

    describe "with invalid parameters" do
      before do
        post "/courses", params: { course: { name: nil } }
      end

      it "returns an unprocessable entity status" do
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end
end
