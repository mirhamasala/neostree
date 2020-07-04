class UnitsController < ApplicationController
  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    @unit.save
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy
  end

  private

  def unit_params
    params.require(:unit).permit(:name)
  end
end
