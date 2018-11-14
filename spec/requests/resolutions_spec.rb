require 'rails_helper'

RSpec.describe "Resolutions", type: :request do
  describe "GET /resolutions" do
    it "works! (now write some real specs)" do
      get resolutions_path
      expect(response).to have_http_status(200)
    end
  end
end
