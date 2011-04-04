require 'spec_helper'

describe "assets/show.html.haml" do
  before(:each) do
    @asset = assign(:asset, stub_model(Asset,
      :type => "Type",
      :post_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
