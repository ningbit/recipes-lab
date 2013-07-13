class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])

    end

    def create #Post
        @recipe = Recipe.new(:name => params[:name])
        @ingredient_list = params[:ingredients_list].split(",").collect {|a| a.strip}
        @recipe.add_ingredients(@ingredient_list)
        if @recipe.save
            redirect_to @recipe
        else
            render :new
        end
    end

    def new #View
        @ingredients = Ingredient.all.sort_by { |e| e.name }
    end

    def edit
        @recipe= Recipe.find(params[:id])
        @ingredients = Ingredient.all.sort_by { |e| e.name }
    end

    def update
        @recipe= Recipe.find(params[:id])
        @recipe.ingredients = []
        @ingredient_list = params[:ingredients_list].split(",").collect {|a| a.strip}
        @recipe.add_ingredients(@ingredient_list)
        @recipe.add_ingredients(@ingredient_list)
        if @recipe.save
            @recipes = Recipe.all
            redirect_to @recipe
        else
            redirect_to edit_recipe_path(@recipe)
        end
    end

    def destroy
        @recipe= Recipe.find(params[:id])
        @recipe.destroy
        @recipes = Recipe.all
        redirect_to recipes_path
    end
end
