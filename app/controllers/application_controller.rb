class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :load_channels

  rescue_from ActionController::RoutingError, :with => :rescue_not_found
  rescue_from ActionController::UnknownAction, :with => :rescue_not_found
  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_not_found

  protect_from_forgery

  protected

  def rescue_not_found
    redirect_to root_path, :error => 'Page Not Found'
  end

  private

  def load_channels
    @channels = current_user.channels if current_user
  end
end
