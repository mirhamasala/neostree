class CollectionStatusesController < ApplicationController
  def update
    @collection = policy_scope(Collection).find(params[:collection_id])
    authorize @collection

    if @collection.status_private?
      @collection.status_public!
    elsif @collection.status_public?
      @collection.status_private!
    end

    redirect_to user_collection_path(current_user.name, @collection)
  end
end
