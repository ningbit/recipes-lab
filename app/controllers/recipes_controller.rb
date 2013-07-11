class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all

    end

    def show
        @recipe = Recipe.find(params[:id])
        
    end

    def create #Post
        @recipe = Recipe.new(:name => params[:name])
        @ingredient_list = params[:ingredient_list].split(",").collect {|a| a.strip}
        @recipe.add_ingredients(@ingredient_list)
        if @recipe.save
            redirect_to @recipe
        else
            render :new
        end
    end

    def new #View

    end

    def edit
    end

    def update
    end

    def destroy
    end
end
