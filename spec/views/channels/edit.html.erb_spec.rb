require 'spec_helper'

describe "channels/edit" do
  before(:each) do
    @channel = assign(:channel, stub_model(Channel,
      :url => "MyString",
      :title => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit channel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => channels_path(@channel), :method => "post" do
      assert_select "input#channel_url", :name => "channel[url]"
      assert_select "input#channel_title", :name => "channel[title]"
      assert_select "input#channel_user_id", :name => "channel[user_id]"
    end
  end
end
