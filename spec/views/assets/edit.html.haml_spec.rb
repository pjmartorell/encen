require 'spec_helper'

describe "assets/edit.html.haml" do
  before(:each) do
    @asset = assign(:asset, stub_model(Asset,
      :type => "MyString",
      :post_id => 1
    ))
  end

  it "renders the edit asset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => asset_path(@asset), :method => "post" do
      assert_select "input#asset_type", :name => "asset[type]"
      assert_select "input#asset_post_id", :name => "asset[post_id]"
    end
  end
end
