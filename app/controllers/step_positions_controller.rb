class StepPositionsController < ApplicationController
  def update
    @step = Step.find(params[:step_id])
    @step.insert_at(params[:position].to_i)
    authorize :step_position
    head :ok
  end
end
