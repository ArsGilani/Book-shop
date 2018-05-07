class UsersController < ApplicationController

  def index_book
  	@books = Book.all
    
  end

  def index_author
  	@authors = Author.all
    
  	
  end
  def index_genre
  	@genres = Genre.all
  end
  def show_book
  	@book = Book.find(params[:id])
  end
  
  def show_author
  	@author = Author.find(params[:id])

  end
  
  def show_genre
	@genre = Genre.find(params[:id])
 
  end
  
end

