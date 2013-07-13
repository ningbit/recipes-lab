class IngredientsController < ApplicationController
  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.all.sort_by { |e| e.name }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ingredients }
    end
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
    @ingredient = Ingredient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ingredient }
    end
  end

  # GET /ingredients/new
  # GET /ingredients/new.json
  def new
    @ingredients = Ingredient.all.sort_by { |e| e.name }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ingredient }
    end
  end

  # GET /ingredients/1/edit
  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient_cart = params[:ingredients_list].split(",").collect {|a| a.strip}
    Ingredient.add_cart(@ingredient_cart)
    redirect_to ingredients_path
  end

  # PUT /ingredients/1
  # PUT /ingredients/1.json
  def update
    @ingredient = Ingredient.find(params[:id])

    respond_to do |format|
      if @ingredient.update_attributes(params[:ingredient])
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @garbage = params[:disposal_list].split("<br>")
    Ingredient.dispose_garbage(@garbage)
    redirect_to ingredients_path
  end
end
