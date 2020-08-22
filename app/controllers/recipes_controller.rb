class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @recipes = policy_scope(Recipe).alphabetize
  end

  def new
    @recipe = Recipe.new

    if request.xhr?
      @recipe.steps.new
      @recipe.measures.new
    else
      @new_steps = 2
      @new_measures = 3
    end
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    authorize @recipe

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])
    authorize @recipe

    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize @recipe

    @recipe.destroy
    redirect_to :root
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :source, :photo, :notes,
                                   :prep_time, :cook_time, :servings,
                                   :step_id, :measure_id,
                                   measures_attributes: %i[id position quantity unit_id
                                                           ingredient_id recipe_id _destroy],
                                   steps_attributes: %i[id position description _destroy])
  end
end
