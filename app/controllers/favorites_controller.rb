class FavoritesController < ApplicationController

  def create #いいねする
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_to request.referer #同じページをリダイレクト
  end

  def destroy #いいね消す
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to request.referer #同じページをリダイレクト
  end

end
