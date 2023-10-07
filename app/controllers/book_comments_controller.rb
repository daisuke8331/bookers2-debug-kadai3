class BookCommentsController < ApplicationController

  def create #コメントを投稿する
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
      @book = Book.find(params[:book_id])
      #redirect_to request.referer 非同期通信のため削除
    else
      #renderを使用する場合、
      #@profile_user = @book.user
      #@newbook = Book.new
      #@book = Book.find(params[:book_id])
      #@book_comment = BookComment.new
      #render "books/show"

      #redirect_to request.referer
    end
  end

  def destroy #コメントを削除する
    BookComment.find(params[:id]).destroy
    @book = Book.find(params[:book_id])
    #redirect_to request.referer　非同期通信のため
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
