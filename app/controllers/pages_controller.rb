class PagesController < ApplicationController

  def home
    @books = Book.last(10)
  end
end
