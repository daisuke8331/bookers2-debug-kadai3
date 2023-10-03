class BooksController < ApplicationController

  before_action :is_matching_login_user, only: [:edit]

  def show
    @newbook = Book.new
    #@user = User.find(params[:id])
    #@user = current_user
    @book = Book.find(params[:id])
    @profile_user = @book.user#詳細画面で、投稿者のプロフィールを表示
  end

  def index
    @newbook = Book
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."#.id追加
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body) #body追加
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end

end
