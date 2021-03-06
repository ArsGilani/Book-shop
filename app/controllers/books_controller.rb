class BooksController < AdminController
  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
      upload_picture
  		redirect_to @book
  	else
  		render 'new'
  	end
  end
  def index
  	@books = Book.all
       respond_to do |format|
      format.html {}
      format.json {render json: @books, status: :ok, location: @books}
    end
  end
  def show
  	@book = Book.find(params[:id])
  end
  def edit
    @book = Book.find(params[:id])
  end
  def destroy
    @book = Book.destroy(params[:id])
    redirect_to books_path
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      upload_picture
      redirect_to @book
    else
      render 'edit'
    end
  end
  def upload_picture
    uploaded_file = params[:book][:picture]
    unless uploaded_file.nil?
      new_file_path = Rails.root.join('public','uploads','books', @book.id.to_s)
      File.open(new_file_path, 'wb') do |file|
        file.write uploaded_file.read
      end
    end
  end
  private
  def book_params
  	params.require(:book).permit(:title, :description, :price, :author_id, :genre_id)
  	
  end
  
end
