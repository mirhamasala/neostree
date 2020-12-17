class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def show
    render status: status_code
  end

  private

  def status_code
    @status_code ||= (params[:code] || 500)
  end
end
