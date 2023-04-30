# frozen_string_literal: true

require "rails_helper"

RSpec.describe("LearningPaths", type: :request) do
  describe "DELETE /destroy" do
    describe "with valid parameters" do
      let(:learning_path) { create(:learning_path) }

      before do
        delete "/learning_paths/#{learning_path.id}"
      end

      it "returns a no content status" do
        expect(response).to(have_http_status(:no_content))
      end
    end

    describe "with unknown learning path id" do
      it "returns a not found status" do
        allow(LearningPath).to(receive(:find_by).and_return(nil))
        delete "/learning_paths/1"
        expect(response).to(have_http_status(:not_found))
      end
    end
  end
end
