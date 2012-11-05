class ChannelArticlesController < ApplicationController

  def update

    @channel_article = current_user.channel_articles.find(params[:id])
    @channel_article.update_attributes(params[:channel_article])

    redirect_to request.referer

  end

end
