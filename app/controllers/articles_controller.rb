class ArticlesController < ApplicationController
  def index
    @articles = current_user.channel_articles.where(:starred => params[:starred])
  end

  def show
  end
end
