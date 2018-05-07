class AuthorsController < AdminController
	def new
		@author = Author.new
	end

	def create
		@author = Author.new(author_params)
		if @author.save
			upload_picture
			redirect_to @author
		else
			render 'new'
		end
	end
	def index
		@authors = Author.all
	end

	def show
		@author = Author.find(params[:id])
	end
	
	def edit
		@author = Author.find(params[:id])
	end
	def destroy
		@author = Author.destroy(params[:id])
		redirect_to authors_path
	end
	def update
	    @author = Author.find(params[:id])
	    if @author.update(author_params)
	      upload_picture
	      redirect_to @author
	    else
	      render 'edit'
	    end
	 end
	def upload_picture
		uploaded_file = params[:author][:picture]
		unless uploaded_file.nil?
			new_file_path = Rails.root.join('public','uploads', 'authors', @author.id.to_s)
			File.open(new_file_path, 'wb') do |file|
			file.write uploaded_file.read
		end
	end
  end

	private

	def author_params
		params.require(:author).permit(:title, :description)
		
	end
end
