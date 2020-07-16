class MeasuresController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @measure = Measure.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
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
    @measure.destroy
    redirect_to recipe_path(@measure.recipe)
  end

  def move
    @measure = Measure.find(params[:id])
    @measure.insert_at(params[:position].to_i)
  end

  private

  def measure_params
    params.require(:measure).permit(:position, :quantity, :ingredient_id, :unit_id)
  end
end
