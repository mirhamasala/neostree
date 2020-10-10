class ErrorsController < ApplicationController
  skip_after_action :verify_authorized

  def show
    render status: status_code
  end

  private

  def status_code
    @status_code ||= (params[:code] || 500)
  end
end
