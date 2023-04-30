# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Authors", type: :request) do
  describe "DELETE /destroy" do
    describe "with valid parameters" do
      let(:author) { create(:author) }
      let(:new_author) { create(:author) }

      before do
        delete "/authors/#{author.id}", params: { author: { new_author_id: new_author.id } }
      end

      it "returns a no content status" do
        expect(response).to(have_http_status(:no_content))
      end
    end

    describe "with unknown author id" do
      it "returns a not found status" do
        allow(Author).to(receive_message_chain(:includes, :find_by).and_return(nil))
        delete "/authors/1"
        expect(response).to(have_http_status(:not_found))
      end
    end
  end
end
