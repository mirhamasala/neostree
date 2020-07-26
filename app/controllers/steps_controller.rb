class StepsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    authorize @recipe

    @step = Step.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    authorize @recipe

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
    authorize @step.recipe

    @step.destroy

    redirect_to recipe_path(@step.recipe)
  end

  private

  def steps_params
    params.require(:step).permit(:description, :recipe_id)
  end
end
