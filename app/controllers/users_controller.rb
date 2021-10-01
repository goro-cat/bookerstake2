class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)##今ログインしているユーザ情報をUserモデルから見つける
    @book = Book.new
    @users = User.all
  end

  def show
    @user = current_user
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to 'book_path(user_id)'
  end

  def edit
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image )
  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id )
  end
end

