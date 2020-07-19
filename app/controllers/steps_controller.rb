class StepsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @step = Step.new(steps_params)
    @step.recipe = @recipe
    if @step.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    redirect_to recipe_path(@step.recipe)
  end

  private

  def steps_params
    params.require(:step).permit(:description, :recipe_id)
  end
end
