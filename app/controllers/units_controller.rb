class UnitsController < ApplicationController
  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    @unit.save
  end

  private

  def unit_params
    params.require(:unit).permit(:name)
  end
end
