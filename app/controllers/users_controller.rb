class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @user = User.find_by(username: params[:username])
    authorize @user

    @recipes = policy_scope(@user.recipes).status_published
  end
end
