class Article < ActiveRecord::Base
  attr_accessible :description, :link, :pub_date, :title, :guid

  has_many :channels, :through => :channel_article

  validates :descriptopm, :link, :pub_date, :title, :guid, :presence => true
  validates :guid, :uniqueness => true
end
