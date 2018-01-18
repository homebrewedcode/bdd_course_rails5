class CommentsController < ApplicationController

  before_action :set_article

  def create
    if current_user
      @comment = @article.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
        flash[:notice] = "Comment has been created"
      else
        flash.now[:alert] = "Comment has not been created"
      end
      redirect_to article_path(@article)
    else
      flash[:alert] = 'You need to sign in or sign up before continuing.'
      redirect_to new_user_session_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
