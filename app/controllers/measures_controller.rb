class MeasuresController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    authorize @recipe

    @measure = Measure.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    authorize @recipe

    @measure = Measure.new(measure_params)
    @measure.recipe = @recipe

    if @measure.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @measure = Measure.find(params[:id])
    authorize @measure.recipe

    @measure.destroy

    redirect_to recipe_path(@measure.recipe)
  end

  private

  def measure_params
    params.require(:measure).permit(:quantity, :ingredient_id, :unit_id)
  end
end
