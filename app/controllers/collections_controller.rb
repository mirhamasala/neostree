class CollectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_after_action :verify_policy_scoped, only: :new

  def index
    @collections = collections
    authorize @collections

    if user != current_user
      @collections = @collections.status_public.alphabetize
    end
  end

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

  def show
    @collection = collections.find(params[:id])
    authorize @collection
  end

  def destroy
    @collection = collections.find(params[:id])
    authorize @collection

    @collection.destroy
  end

  private

  def collection_params
    params.require(:collection).permit(:title, :user_id)
  end

  def collections
    policy_scope(Collection.owner(user))
  end

  def user
    User.find_by(username: params[:user_username])
  end
end