class MenusController < ApplicationController
    def index
    end
    
    def show
    end
    
    def new
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def menu_params
        params.require(:menu).permit(:title, :caption, :genre_id, :menu_image)
    end

end
