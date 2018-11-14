require 'rails_helper'

RSpec.describe "resolutions/show", type: :view do
  before(:each) do
    @resolution = assign(:resolution, Resolution.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
