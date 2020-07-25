class MeasurePositionsController < ApplicationController
  def update
    @measure = Measure.find(params[:measure_id])
    @measure.insert_at(params[:position].to_i)
    authorize :measure_position
    head :ok
  end
end
