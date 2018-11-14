require 'rails_helper'

RSpec.describe "resolutions/index", type: :view do
  before(:each) do
    assign(:resolutions, [
      Resolution.create!(),
      Resolution.create!()
    ])
  end

  it "renders a list of resolutions" do
    render
  end
end
