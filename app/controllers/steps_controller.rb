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

  def edit
    @step = Step.find(params[:id])
  end

  def update
    @step = Step.find(params[:id])
    if @step.update(step_params)
      redirect_to recipe_path(@step.recipe)
    else
      render :edit
    end
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    redirect_to recipe_path(@step.recipe)
  end

  private

  def step_params
    params.require(:step).permit(:position, :description, :recipe_id)
  end
end
