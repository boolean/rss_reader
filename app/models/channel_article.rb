class ChannelArticle < ActiveRecord::Base
  attr_accessible :article_id, :channel_id, :starred

  belongs_to :article
  belongs_to :channel

  validates :article_id, :channel_id, :presence => true
end
