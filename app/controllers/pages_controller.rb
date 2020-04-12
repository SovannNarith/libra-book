class PagesController < ApplicationController

  def home
    @books = Book.last(25)
  end
end
