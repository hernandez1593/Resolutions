require 'rails_helper'

RSpec.describe "resolutions/new", type: :view do
  before(:each) do
    assign(:resolution, Resolution.new())
  end

  it "renders new resolution form" do
    render

    assert_select "form[action=?][method=?]", resolutions_path, "post" do
    end
  end
end
