require 'spec_helper'

describe "comments/index.html.haml" do
  before(:each) do
    assign(:comments, [
      stub_model(Comment,
        :name => "Name",
        :mail => "Mail",
        :body => "MyText",
        :user_id => 1,
        :post_id => 1
      ),
      stub_model(Comment,
        :name => "Name",
        :mail => "Mail",
        :body => "MyText",
        :user_id => 1,
        :post_id => 1
      )
    ])
  end

  it "renders a list of comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mail".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
