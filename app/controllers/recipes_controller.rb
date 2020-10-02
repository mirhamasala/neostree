class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

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
    @recipe.user = current_user
    authorize @recipe

    if @recipe.save
      flash[:notice] = t('.success')
      redirect_to recipe_path(@recipe)
    else
      flash.now[:alert] = t('.failure')
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

    if @recipe.update(merge_recipe_params!)
      flash[:notice] = t('.success')
      redirect_to recipe_path(@recipe)
    else
      flash.now[:alert] = t('.failure')
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize @recipe

    if @recipe.destroy
      flash[:notice] = t('.success', recipe: @recipe.title)
      redirect_to user_path(current_user.username)
    else
      flash[:alert] = t('.failure')
      redirect_back(fallback_location: user_path(current_user.username))
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title, :intro, :source, :notes, :photo, :status,
      :prep_time, :cook_time, :yield_type, :yield,
      :measure_id, :step_id, :user_id,
      measures_attributes: %i[id position ingredient unit quantity prep_method recipe_id _destroy],
      steps_attributes: %i[id position description _destroy]
    )
  end

  def merge_recipe_params!
    recipe_params.merge(
      steps_attributes: reordered_steps,
      measures_attributes: reordered_measures
    )
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
      measure_hash['unit'].empty?
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
