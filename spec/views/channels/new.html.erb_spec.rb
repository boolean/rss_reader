require 'spec_helper'

describe "channels/new" do
  before(:each) do
    assign(:channel, stub_model(Channel,
      :url => "MyString",
      :title => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new channel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => channels_path, :method => "post" do
      assert_select "input#channel_url", :name => "channel[url]"
      assert_select "input#channel_title", :name => "channel[title]"
      assert_select "input#channel_user_id", :name => "channel[user_id]"
    end
  end
end
