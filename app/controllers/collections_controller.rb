class CollectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  skip_after_action :verify_policy_scoped, only: :new

  def new
    @collection = Collection.new
    authorize @collection

    @user = current_user
    @recipes = @user.recipes
    @collection.user = @user
  end

  def create
    @collection = collections.build(collection_params)
    authorize @collection

    if @collection.save
      flash[:notice] = t('.success')
      redirect_to user_collection_path(current_user.username, @collection)
    else
      flash.now[:alert] = t('.failure')
      render :new
    end
  end

  def edit
    @collection = collections.find(params[:id])
    authorize @collection

    @user = current_user
    @recipes = current_user.recipes
  end

  def update
    @collection = collections.find(params[:id])
    authorize @collection

    if @collection.update(collection_params)
      flash[:notice] = t('.success')
      redirect_to user_collection_path(current_user.username, @collection)
    else
      flash.now[:alert] = t('.failure')
      render :edit
    end
  end

  def show
    @collection = policy_scope(Collection).find(params[:id])
    authorize @collection
  end

  def destroy
    @collection = collections.find(params[:id])
    authorize @collection

    @collection.destroy
    flash[:notice] = t('.success', collection: @collection.title)
    redirect_to user_path(current_user.username)
  end

  private

  def collections
    policy_scope(current_user.collections)
  end

  def collection_params
    params.require(:collection).permit(:title, :user_id, :status, recipe_ids: [])
  end
end
