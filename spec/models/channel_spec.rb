require 'spec_helper'

describe Channel do

  before :each do
    @channel = Channel.new(url: 'http://feeds.feedburner.com/Rubyflow')
    @channel.user_id = 1
  end

  it "should return a Channel instance" do
    @channel = Channel.new
    @channel.should_not be_nil
  end

  it "Should save the channel" do
    @channel.save.should be_true
  end

  it "Should update the feeds and still be valid" do
    @channel.save
    @channel.update_feeds
    @channel.should be_valid
  end

  it "should have articles" do
    @channel.save
    @channel.update_feeds
    @channel.articles.should_not be_empty
  end

  it "should re-use the articles" do
    @channel.save
    @channel.update_feeds

    channel = Channel.new(url: 'http://feeds.feedburner.com/Rubyflow')
    channel.user_id = 1
    channel.save
    channel.update_feeds
    channel.articles.should_not be_empty
  end
end
