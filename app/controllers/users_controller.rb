class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path_params
  end
    
  def edit
  end
  
  def book_path_params
    params.require()
  end
end
