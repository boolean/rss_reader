class CommentsController < ApplicationController

  def create
    @commentable = find_commentable

    @comment = @commentable.comments.build(params[:comment])
    @comment.user = current_user

    if @comment.save
      redirect_to request.referer, notice: "Successfully saved comment"
    else
      render :action => 'new'
    end
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
