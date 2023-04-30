# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Talents", type: :request) do
  describe "PUT /update" do
    let(:talent) { create(:talent) }

    describe "with valid parameters" do
      before do
        put "/talents/#{talent.id}", params: { talent: { name: "John Doe" } }
      end

      it "returns talent" do
        expect(json["id"]).to(eq(talent.id))
        expect(json["name"]).to(eq("John Doe"))
      end

      it "returns an ok status" do
        expect(response).to(have_http_status(:ok))
      end
    end

    describe "with invalid parameters" do
      before do
        put "/talents/#{talent.id}", params: { talent: { name: nil } }
      end

      it "returns an unprocessable entity status" do
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end

    describe "with unknown talent id" do
      it "returns a not found status" do
        allow(Talent).to(receive(:find_by).and_return(nil))
        put "/talents/1"
        expect(response).to(have_http_status(:not_found))
      end
    end
  end
end
