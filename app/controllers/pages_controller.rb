class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'home'

  def home; end

  def about
    @devon = User.find_by(username: 'devonkan')
    @mirha = User.find_by(username: 'mirhamasala')
    @silvia = User.find_by(username: 'silviafalcomer')

    render layout: 'application'
  end
end
