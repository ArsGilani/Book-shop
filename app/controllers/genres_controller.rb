class GenresController < AdminController
	def new
		@genre = Genre.new
	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to @genre
		else
			render 'new'
		end
	end
	def index
		@genres = Genre.all
	end
	def show
		@genre = Genre.find(params[:id])
	end
	def edit
		@genre = Genre.find(params[:id])
	end
	def destroy
		@genre = Genre.destroy(params[:id])
		redirect_to genres_path
	end
	def update
	    @genre = Genre.find(params[:id])
	    if @genre.update(genre_params)
	      
	      redirect_to @genre
	    else
	      render 'edit'
	    end
  	end
	private

	def genre_params
	params.require(:genre).permit(:title, :description)

	end

end
