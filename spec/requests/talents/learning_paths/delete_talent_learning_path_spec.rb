# frozen_string_literal: true

require "rails_helper"

RSpec.describe("TalentLearningPaths", type: :request) do
  describe "DELETE /destroy" do
    describe "with valid parameters" do
      let(:talent) { create(:talent) }
      let(:learning_path) { create(:learning_path, courses: create_list(:course, 3)) }
      let(:talent_learning_path) { create(:talent_learning_path, talent: talent, learning_path: learning_path) }

      it "returns a no content status" do
        delete "/talents/#{talent_learning_path.talent_id}/learning_paths/#{talent_learning_path.learning_path_id}"
        expect(response).to(have_http_status(:no_content))
      end
    end

    describe "with unknown learning path and talent id" do
      it "returns a not found status" do
        allow(TalentLearningPath).to(receive(:find_by).and_return(nil))
        delete "/talents/1/learning_paths/1"
        expect(response).to(have_http_status(:not_found))
      end
    end
  end
end
