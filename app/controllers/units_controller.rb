class UnitsController < ApplicationController
  def new
    @unit = Unit.new
    authorize @unit
  end

  def create
    @unit = Unit.new(unit_params)
    authorize @unit

    if @unit.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    authorize @unit

    @unit.destroy

    redirect_to dashboard_path
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :fractionable)
  end
end
