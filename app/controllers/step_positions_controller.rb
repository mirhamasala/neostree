class StepPositionsController < ApplicationController
  def update
    @step = policy_scope(Step).find(params[:step_id])
    authorize @step.recipe

    @step.insert_at(params[:position].to_i)

    head :ok
  end
end
