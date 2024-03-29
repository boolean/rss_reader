require 'rss'

class Channel < ActiveRecord::Base
  attr_accessible :title, :url

  belongs_to :user

  has_many :channel_articles
  has_many :articles, :through => :channel_articles

  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates :user_id, :url, presence: true

  def initialize(attributes=nil, options={})
    super(attributes, options)

    self.update_feeds if !self.url.blank? and self.valid?
  end

  def update_feeds
    open(self.url) do |rss|
      feed = RSS::Parser.parse(rss)

      self.title = feed.channel.title if self.title.blank?

      feed.items.each do |item|
        article = Article.find_or_initialize_by_guid(title: item.title,
                                                     description: item.description,
                                                     pub_date: item.pubDate,
                                                     link: item.link,
                                                     guid: item.guid.content)

        self.articles << article if article.valid?
      end

    end
  end
end
