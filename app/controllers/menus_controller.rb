class MenusController < ApplicationController
    def index
        @menus = Menu.all
        @tags = Tag.all
    end
    
    def show
        @menu = Menu.find(params[:id])
        @tag_list=@menu.tags.pluck(:name).join(',')
    end
    
    def new
        @menu = Menu.new
    end
    
    def create
        @menu = Menu.new(menu_params)
        @menu.user_id = current_user.id
        @menu.genre_id = 1
        if @menu.user != current_user
            redirect_to user_path(current_user)
        end
        tag_list=params[:menu][:tag_name].split(',')
        if @menu.save
            tag_list.each do |tag|
                new_menu_tag = Tag.find_or_create_by(name: tag)
                @menu.tags << new_menu_tag
            end
            redirect_to menu_path(@menu)
        else
            render :new
        end
    end
    
    def edit
        @menu = Menu.find(params[:id])
        @tags = @menu.tags.pluck(:name).join(',')
        if @menu.user != current_user
            redirect_to user_path(current_user)
        end
    end
    
    def update
        @menu = Menu.find(params[:id])
        @menu.genre_id = 1
        tag_list=params[:menu][:tag_name].split(',')
        if @menu.user != current_user
            redirect_to user_path(current_user)
        elsif @menu.update(menu_params)
            @menu.save_tag(tag_list)
            redirect_to menu_path(@menu)
        else
            render :edit
        end
        
    end
    
    def destroy
        @menu = Menu.find(params[:id])
        if @menu.user != current_user
            redirect_to user_path(current_user)
        end
        if @menu.delete
            redirect_to user_path(current_user)
        else
            redirect_to menu_path(@menu)
        end
    end
    
    private
    
    def menu_params
        params.require(:menu).permit(:title, :caption, :genre_id, :menu_image)
    end

end
