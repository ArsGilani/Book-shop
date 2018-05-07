class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.create(comment_params)

    respond_to do |format|
      format.html {redirect_to @book}
      format.js {}
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    #redirect_to article_path(@article)

    respond_to do |format|
      # format.html { redirect_to article }
      format.json { head :no_content }
      format.js {}
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:name, :description)

  end
end
