class MeasuresController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.new
    authorize @measure
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.new(measure_params)
    @measure.recipe = @recipe
    authorize @measure
    if @measure.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @measure = Measure.find(params[:id])
    authorize @measure
    @measure.destroy
    redirect_to recipe_path(@measure.recipe)
  end

  private

  def measure_params
    params.require(:measure).permit(:quantity, :ingredient_id, :unit_id)
  end
end
