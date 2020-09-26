class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    authorize :user

    @user = User.find_by(username: params[:username])
    @recipes = Recipe.author(@user).status_published.alphabetize
  end
end
