class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'home'

  def home; end
end
