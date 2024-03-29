class MeasurePositionsController < ApplicationController
  def update
    @measure = policy_scope(Measure).find(params[:measure_id])
    authorize @measure.recipe

    @measure.insert_at(params[:position].to_i)

    head :ok
  end
end
