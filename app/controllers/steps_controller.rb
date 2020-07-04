class StepsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.new(steps_params)
    @step.recipe = @recipe
    @step.save
    redirect_to recipe_path(@recipe)
  end

  private

  def steps_params
    params.require(:step).permit(:position, :description, :recipe_id)
  end
end
