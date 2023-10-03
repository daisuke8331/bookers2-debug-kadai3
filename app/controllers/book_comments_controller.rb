class BookCommentsController < ApplicationController

  def create #コメントを投稿する
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
      redirect_to request.referer
    else
      @user = profile_user.find(params[:id])#ここでnameerror
      render "books/show"
    end
  end

  def destroy #コメントを削除する
    BookComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
