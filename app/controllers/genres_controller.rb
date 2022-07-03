class GenresController < ApplicationController
    def index
    end
    
    def show
        @genre = Genre.find(params[:id])
    end
    
    def new
        @genre = Genre.new
    end
    
    def create
        @genre = Genre.new(genre_params)
        @genre.save
        redirect_to genre_path(@genre)
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def genre_params
        params.require(:genre).permit(:name)
    end
end
