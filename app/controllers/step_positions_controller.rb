class StepPositionsController < ApplicationController
  def update
    @step = Step.find(params[:step_id])
    @step.insert_at(params[:position].to_i)
  end
end
