require 'spec_helper'

describe "assets/new.html.haml" do
  before(:each) do
    assign(:asset, stub_model(Asset,
      :type => "MyString",
      :post_id => 1
    ).as_new_record)
  end

  it "renders new asset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assets_path, :method => "post" do
      assert_select "input#asset_type", :name => "asset[type]"
      assert_select "input#asset_post_id", :name => "asset[post_id]"
    end
  end
end
