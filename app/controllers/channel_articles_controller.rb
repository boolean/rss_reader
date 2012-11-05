class ChannelArticlesController < ApplicationController

  def index
    @articles = current_user.channel_articles.where(:starred => params[:starred] == 'true')
  end

  def update

    @channel_article = current_user.channel_articles.find(params[:id])
    @channel_article.update_attributes(params[:channel_article])

    redirect_to request.referer

  end

end
