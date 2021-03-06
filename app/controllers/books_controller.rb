class BooksController < ApplicationController

    before_action :require_user, only: [:new, :create,:edit, :update, :destroy]

  def index
    @books = new_books
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.book_image.attached? || @book.book_file.attached?
      if @book.save
        flash[:success] = "Yeah! You have posted new book"
        redirect_to book_path(@book)
      else
        flash[:warning] = "Ouch you have something wrong please check!"
        render 'new'
      end
    else
      flash[:warning] = "No file selected"
      render 'new'
    end
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:success] = "Update Book Has Successfull!"
      redirect_to book_path(@book)
    else
      flash[:warning] = "Something was wrong"
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:danger] = "You have delete a posted"
      render 'index'
    end
  end


  private
    def book_params
      params.require(:book).permit(:title, :description, :book_image, :book_file)
    end

    def new_books
      books = Book.last(8)
    end


end
