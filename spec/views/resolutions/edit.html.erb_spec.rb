require 'rails_helper'

RSpec.describe "resolutions/edit", type: :view do
  before(:each) do
    @resolution = assign(:resolution, Resolution.create!())
  end

  it "renders the edit resolution form" do
    render

    assert_select "form[action=?][method=?]", resolution_path(@resolution), "post" do
    end
  end
end
