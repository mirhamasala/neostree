class RecipeStatusesController < ApplicationController
  def update
    @recipe = policy_scope(Recipe).find(params[:recipe_id])
    authorize @recipe

    if @recipe.status_draft?
      @recipe.status_published!
    elsif @recipe.status_published?
      @recipe.status_draft!
    end

    redirect_to recipe_path(@recipe)
  end
end
