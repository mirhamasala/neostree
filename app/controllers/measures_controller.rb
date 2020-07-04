class MeasuresController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.new(measure_params)
    @measure.recipe = @recipe
    @measure.save
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @measure = Measure.find(params[:id])
    @measure.destroy
    redirect_back(fallback_location:"/")
  end

  private

  def measure_params
    params.require(:measure).permit(:quantity, :ingredient_id, :unit_id)
  end
end
