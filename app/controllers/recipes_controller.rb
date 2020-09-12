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

    if @recipe.update(recipe_params.merge(steps_attributes: reordered_steps,
                                          measures_attributes: reordered_measures))
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
    params.require(:recipe).permit(:title, :source, :photo, :notes, :prep_time, :cook_time, :servings,
                                   :step_id, :measure_id,
                                   measures_attributes: %i[id position ingredient prep_method quantity
                                                           unit_id recipe_id _destroy],
                                   steps_attributes: %i[id position description _destroy])
  end

  def empty_step?(step_hash)
    step_hash['description'].empty?
  end

  def reordered_steps
    return {} unless recipe_params[:steps_attributes]

    reordered_steps = recipe_params[:steps_attributes].to_unsafe_h

    reordered_steps.delete_if do |_, step_hash|
      empty_step?(step_hash)
    end

    reordered_steps.each_with_index do |array, index|
      key = array.first
      reordered_steps[key][:position] = (index + 1)
    end
  end

  def empty_measure?(measure_hash)
    measure_hash['ingredient'].empty? &&
      measure_hash['quantity'].empty? &&
      measure_hash['unit_id'].empty?
  end

  def reordered_measures
    return {} unless recipe_params[:measures_attributes]

    reordered_measures = recipe_params[:measures_attributes].to_unsafe_h

    reordered_measures.delete_if do |_, measure_hash|
      empty_measure?(measure_hash)
    end

    reordered_measures.each_with_index do |array, index|
      key = array.first
      reordered_measures[key][:position] = (index + 1)
    end
  end
end
